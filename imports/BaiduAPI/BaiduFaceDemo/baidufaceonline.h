#ifndef BAIDUFACEONLINE_H
#define BAIDUFACEONLINE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QUrl>
#include <QNetworkReply>
#include <QMessageBox>
#include <QImage>
#include <QFile>
#include <QTextStream>
#include <QBuffer>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDebug>

class BaiduFaceOnline : public QObject
{
    Q_OBJECT
public:
    explicit BaiduFaceOnline(QObject *parent = nullptr);

    void https_ssl_config(QNetworkRequest& NetworkRequest);
    QString image2base64_str(const QImage& img);
    QImage base64_str2image(const QString & base64_str);
    void writeAccToken(const QString& token);
    QString readAccToken();
public slots:
    void getAccToken();
    void FaceDetect(const QImage& image);
    void FaceMatch(const QImage& image1, const QImage& image2);
    void FaceSerch(const QImage& image);
    void FaceRegister(const QImage& image, const QString& group_id, const QString& user_id);
    void CardScan(const QImage& image);
private slots:
    void getAccTokenReply(QNetworkReply* reply);
    void FaceDetectReply(QNetworkReply* reply);
    void FaceMatchReply(QNetworkReply* reply);
    void FaceSerchReply(QNetworkReply* reply);
    void FaceRegisterReply(QNetworkReply* reply);
    void CardScanReply(QNetworkReply* reply);
signals:
    void DetectReply(QString content);
    void MatchReply(QString content);
    void SerchReply(QString content);
    void RegisterReply(QString content);
private:
    QNetworkAccessManager* NetAccManager;
    QNetworkRequest NetRequest;
    /* 应用参数 */
    const QString API_Key = "jMdmoEUEh79QW9ShbMqTSbg3";
    const QString Secret_Key = "tHMX0LpGnNVbF7j7NL3SuAWZVd0kyDMk";
    //QString AccToken = "24.cb92d75727f371bce7e92221834b7ee4.2592000.1647063914.282335-25591090";
    QString AccToken = "";
    /* 应用参数end */
    const QString FaceMatchUrl = "https://aip.baidubce.com/rest/2.0/face/v3/match";
    const QString FaceSerchUrl = "https://aip.baidubce.com/rest/2.0/face/v3/search";
    const QString FaceDetectUrl = "https://aip.baidubce.com/rest/2.0/face/v3/detect";
    const QString FaceAdd = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
};

#endif // BAIDUFACEONLINE_H
