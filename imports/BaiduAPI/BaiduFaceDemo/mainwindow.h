#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFileDialog>
#include <QPixmap>
#include <QButtonGroup>
#include "baidufaceonline.h"
#include "screenwidget.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_open_img_triggered();

    void on_act_baidu_triggered();

    void getDetectReply(QString content);
    void getSerchReply(QString content);
    void getRegisterReply(QString content);
    void getMatchReply(QString content);
    void on_face_register_clicked();

    void on_actScreenshot_triggered();

    void drawPixmap(const QPixmap& pixmap);
private:
    Ui::MainWindow *ui;
    BaiduFaceOnline* BaiduFace;
    QButtonGroup* ButtonG;
    ScreenWidget* swidget;
};
#endif // MAINWINDOW_H
