#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    swidget = new ScreenWidget;
    connect(swidget,&ScreenWidget::overShot,this,&MainWindow::drawPixmap);
    ui->group_id->setText("faces_001");
    ui->tabWidget->setCurrentIndex(0);
    ButtonG = new QButtonGroup(this);
    ButtonG->addButton(ui->radioButton1,1);
    ButtonG->addButton(ui->radioButton2,2);
    ButtonG->button(1)->setChecked(true);
    ui->detect_path->setReadOnly(true);
    ui->serch_path->setReadOnly(true);
    ui->match1_path->setReadOnly(true);
    ui->match2_path->setReadOnly(true);
    BaiduFace = new BaiduFaceOnline(this);
    connect(BaiduFace,&BaiduFaceOnline::DetectReply,this,&MainWindow::getDetectReply);
    connect(BaiduFace,&BaiduFaceOnline::SerchReply,this,&MainWindow::getSerchReply);
    connect(BaiduFace,&BaiduFaceOnline::MatchReply,this,&MainWindow::getMatchReply);
    connect(BaiduFace,&BaiduFaceOnline::RegisterReply,this,&MainWindow::getRegisterReply);

    QFile f(":qdarkstyle/style.qss");
    if (!f.exists())
    {
        printf("Unable to set stylesheet, file not found\n");
    }
    else
    {
        f.open(QFile::ReadOnly | QFile::Text);
        QTextStream ts(&f);
        qApp->setStyleSheet(ts.readAll());
        f.close();
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::getDetectReply(QString content)
{
    ui->tBdetect->append(content);
}

void MainWindow::getMatchReply(QString content)
{
    ui->tBmatch->setText(content);
}

void MainWindow::getRegisterReply(QString content)
{
    ui->tBserch->append(content);
}
void MainWindow::getSerchReply(QString content)
{
    ui->tBserch->append(content);
}

void MainWindow::on_open_img_triggered()
{
    QString filename = QFileDialog::getOpenFileName();
    if(!filename.isEmpty())
    {
        QImage img(filename);
        switch (ui->tabWidget->currentIndex())
        {
            case 0:
            {

                ui->detect_path->setText(filename);
                ui->lab_detect->setPixmap(QPixmap::fromImage(img.scaled(300,400,Qt::KeepAspectRatio)));
                ui->lab_detect->show();
                break;
            }
            case 1:
            {

                ui->serch_path->setText(filename);
                ui->lab_serch->setPixmap(QPixmap::fromImage(img.scaled(300,400,Qt::KeepAspectRatio)));
                ui->lab_serch->show();
                break;
            }
            case 2:
            {
                if(ButtonG->checkedId() == 1)
                {
                    ui->match1_path->setText(filename);
                    ui->lab_match1->setPixmap(QPixmap::fromImage(img.scaled(300,400,Qt::KeepAspectRatio)));
                    ui->lab_match1->show();
                }
                else
                {
                    ui->match2_path->setText(filename);
                    ui->lab_match2->setPixmap(QPixmap::fromImage(img.scaled(300,400,Qt::KeepAspectRatio)));
                    ui->lab_match2->show();
                }
                break;
            }
        }
    }
}

void MainWindow::on_act_baidu_triggered()
{
    switch (ui->tabWidget->currentIndex())
    {
        case 0:
        {
            BaiduFace->FaceDetect(QImage(ui->detect_path->text()));
            break;
        }
        case 1:
        {
            BaiduFace->FaceSerch(QImage(ui->serch_path->text()));
            break;
        }
        case 2:
        {
            BaiduFace->FaceMatch(QImage(ui->match1_path->text()),QImage(ui->match2_path->text()));
            break;
        }
    }
}

void MainWindow::on_face_register_clicked()
{
    QString group_name = ui->group_id->text();
    QString user_name = ui->user_id->text();
    if(!group_name.isEmpty() && !user_name.isEmpty())
    {
        BaiduFace->FaceRegister(QImage(ui->serch_path->text()), group_name, user_name);
        return;
    }
    QMessageBox::information(this,"提示","注册信息不完整！");
}

void MainWindow::on_actScreenshot_triggered()
{
    swidget->showFullScreen();
}
void MainWindow::drawPixmap(const QPixmap& pixmap)
{
    switch (ui->tabWidget->currentIndex())
    {
        case 0:
        {
        ui->serch_path->clear();
        ui->lab_serch->clear();
            ui->detect_path->setText(QString("%1/screen_shot.png").arg(qApp->applicationDirPath()));
            ui->lab_detect->setPixmap(pixmap.scaled(300,400,Qt::KeepAspectRatio));
            break;
        }
        case 1:
        {
        ui->detect_path->clear();
        ui->lab_detect->clear();
            ui->serch_path->setText(QString("%1/screen_shot.png").arg(qApp->applicationDirPath()));
            ui->lab_serch->setPixmap(pixmap.scaled(300,400,Qt::KeepAspectRatio));
            break;
        }
    }
}
