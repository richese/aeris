#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPainter>


#include "app_core.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

    void on_pushButton_3_clicked();

    void on_pushButton_5_clicked();

    void on_pushButton_4_clicked();

    void on_pushButton_9_clicked();

    void on_pushButton_8_clicked();

    void on_pushButton_6_clicked();

    void on_pushButton_7_clicked();


    void on_actionOpen_triggered();

    void on_actionSave_triggered();

    void on_actionSave_as_triggered();

    void on_actionClose_triggered();

    void on_actionNew_triggered();

    void on_actionDelete_triggered();

    void on_actionWall_triggered();

    void on_actionRed_robot_triggered();

    void on_actionRed_target_triggered();

    void on_actionRed_path_triggered();

    void on_actionGreen_robot_triggered();

    void on_actionGreen_target_triggered();

    void on_actionGreen_path_triggered();

    void on_actionBlue_robot_triggered();

    void on_actionBlue_target_triggered();

    void on_actionBlue_path_triggered();

    void on_actionPath_triggered();

    void on_actionTarget_triggered();

    void on_actionSource_triggered();

    void on_actionDestination_triggered();

protected:
    void mousePressEvent(QMouseEvent *event);

    void paintEvent(QPaintEvent *);

private:
    int x_pos, y_pos;

    Ui::MainWindow *ui;

    QString fileName;

    #ifdef _CORE_H_
    class CAppCore *core;
    #endif
};

#endif // MAINWINDOW_H
