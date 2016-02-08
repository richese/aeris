#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QPainter>
#include <QFileDialog>
#include <QMouseEvent>
#include <stdio.h>

#include "app_core.h"

#ifndef _CORE_H_
    #include "../../common/rewards.h"
#else
    #include "../common/rewards.h"
#endif

// #define _CORE_H_

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    x_pos = 0;
    y_pos = 0;

    #ifdef _CORE_H_
    core = new CAppCore();
    #endif

}

MainWindow::~MainWindow()
{
    delete ui;

    #ifdef _CORE_H_
    delete core;
    #endif
}


void MainWindow::on_pushButton_clicked()
{
    #ifdef _CORE_H_
    core->on_delete();
    #endif

   ui->doubleSpinBox->setValue(REWARD_EMPTY);
}

void MainWindow::on_pushButton_2_clicked()
{
    #ifdef _CORE_H_
    core->on_wall();
    #endif

    ui->doubleSpinBox->setValue(REWARD_WALL);
}

void MainWindow::on_pushButton_3_clicked()
{
    #ifdef _CORE_H_
    core->on_red_robot();
    #endif

    ui->doubleSpinBox->setValue(REWARD_RED_ROBOT);
}

void MainWindow::on_pushButton_5_clicked()
{
    #ifdef _CORE_H_
    core->on_green_robot();
    #endif

    ui->doubleSpinBox->setValue(REWARD_GREEN_ROBOT);
}

void MainWindow::on_pushButton_4_clicked()
{
    #ifdef _CORE_H_
    core->on_blue_robot();
    #endif

    ui->doubleSpinBox->setValue(REWARD_BLUE_ROBOT);
}

void MainWindow::on_pushButton_9_clicked()
{
    #ifdef _CORE_H_
    core->on_path();
    #endif

    ui->doubleSpinBox->setValue(REWARD_PATH);
}

void MainWindow::on_pushButton_8_clicked()
{
    #ifdef _CORE_H_
    core->on_target();
    #endif

    ui->doubleSpinBox->setValue(REWARD_TARGET);
}

void MainWindow::on_pushButton_6_clicked()
{
    #ifdef _CORE_H_
    core->on_source();
    #endif

    ui->doubleSpinBox->setValue(REWARD_SOURCE);
}

void MainWindow::on_pushButton_7_clicked()
{
    #ifdef _CORE_H_
    core->on_destination();
    #endif

    ui->doubleSpinBox->setValue(REWARD_DESTINATION);
}

void MainWindow::on_actionNew_triggered()
{
    QString fileName = QFileDialog::getSaveFileName(this, tr("Save File"));

    #ifdef _CORE_H_
    core->on_new((char*)fileName.toStdString().c_str());
    #endif
}

void MainWindow::on_actionOpen_triggered()
{
    QString fileName = QFileDialog::getOpenFileName(this, tr("Open File"));

    #ifdef _CORE_H_
    core->on_open((char*)fileName.toStdString().c_str());
    #endif
}


void MainWindow::mousePressEvent(QMouseEvent *event)
{
    x_pos = event->x();
    y_pos = event->y();

    this->repaint();
}

void MainWindow::paintEvent(QPaintEvent *)
{
    float reward = ui->doubleSpinBox->value();
    int int_param = ui->spinBox->value();
    float float_param = ui->doubleSpinBox_2->value();

    #ifdef _CORE_H_
    int base_size = 20;
    int x_min = 16;
    int y_min = 30;

    int x_max = 16*base_size*2;
    int y_max = 9*base_size*2;



    x_pos-= base_size/2;
    y_pos-= base_size/2;

    int paint_width = x_max - x_min;
    int paint_height = y_max - y_min;

    int x = ((x_pos - x_min)*core->get_width()) / paint_width;
    int y = ((y_pos - y_min)*core->get_height()) / paint_height;




    if ( (x_pos > x_min) &&
         (x_pos < x_max) &&
         (y_pos > y_min) &&
         (y_pos < y_max) )
    {


        core->on_click(x, y, reward, int_param, float_param);
    }

    QPainter painter;

    painter.begin(this);

    unsigned int i, j;

    for (j = 0; j < core->get_height(); j++)
        for (i = 0; i < core->get_width(); i++)
        {
            struct sMapField field;

            field = core->get_field(i, j);

            painter.setPen(QColor(0, 0, 0, 127));
            painter.setBrush(QColor(field.color[0], field.color[1], field.color[2], 127) );

            float x = field.position[0]*(paint_width / core->get_width()) + x_min + base_size/2;
            float y = field.position[1]*(paint_height / core->get_height()) + y_min + base_size/2;

             painter.drawRect(x, y, base_size, base_size);
        }

    painter.end();
    #endif

    x_pos = -1;
    y_pos = -1;
}



void MainWindow::on_actionSave_triggered()
{
    int save_res = -1;

    #ifdef _CORE_H_
    save_res = core->on_save((char*)fileName.toStdString().c_str());
    #endif

    if (save_res < 0)
    {
        fileName = QFileDialog::getSaveFileName(this, tr("Save File"));

        #ifdef _CORE_H_
        core->on_save_as((char*)fileName.toStdString().c_str());
        #endif
    }
}

void MainWindow::on_actionSave_as_triggered()
{
    fileName = QFileDialog::getSaveFileName(this, tr("Save File"));

    #ifdef _CORE_H_
    core->on_save_as((char*)fileName.toStdString().c_str());
    #endif
}

void MainWindow::on_actionClose_triggered()
{
    this->close();
}


void MainWindow::on_actionDelete_triggered()
{
    #ifdef _CORE_H_
    core->on_delete();
    #endif

    ui->doubleSpinBox->setValue(REWARD_EMPTY);
}

void MainWindow::on_actionWall_triggered()
{
    #ifdef _CORE_H_
    core->on_wall();
    #endif

    ui->doubleSpinBox->setValue(REWARD_WALL);
}

void MainWindow::on_actionRed_robot_triggered()
{
    #ifdef _CORE_H_
    core->on_red_robot();
    #endif

    ui->doubleSpinBox->setValue(REWARD_RED_ROBOT);
}

void MainWindow::on_actionRed_target_triggered()
{
    #ifdef _CORE_H_
    core->on_red_target();
    #endif

    ui->doubleSpinBox->setValue(REWARD_RED_TARGET);
}

void MainWindow::on_actionRed_path_triggered()
{
    #ifdef _CORE_H_
    core->on_red_path();
    #endif

    ui->doubleSpinBox->setValue(REWARD_RED_PATH);
}

void MainWindow::on_actionGreen_robot_triggered()
{
    #ifdef _CORE_H_
    core->on_green_robot();
    #endif

    ui->doubleSpinBox->setValue(REWARD_GREEN_ROBOT);
}

void MainWindow::on_actionGreen_target_triggered()
{
    #ifdef _CORE_H_
    core->on_green_target();
    #endif

    ui->doubleSpinBox->setValue(REWARD_GREEN_TARGET);
}

void MainWindow::on_actionGreen_path_triggered()
{
    #ifdef _CORE_H_
    core->on_green_path();
    #endif

    ui->doubleSpinBox->setValue(REWARD_GREEN_PATH);
}

void MainWindow::on_actionBlue_robot_triggered()
{
    #ifdef _CORE_H_
    core->on_blue_robot();
    #endif

    ui->doubleSpinBox->setValue(REWARD_BLUE_ROBOT);
}

void MainWindow::on_actionBlue_target_triggered()
{
    #ifdef _CORE_H_
    core->on_blue_target();
    #endif

    ui->doubleSpinBox->setValue(REWARD_BLUE_TARGET);
}

void MainWindow::on_actionBlue_path_triggered()
{
    #ifdef _CORE_H_
    core->on_blue_path();
    #endif

    ui->doubleSpinBox->setValue(REWARD_BLUE_PATH);
}

void MainWindow::on_actionPath_triggered()
{
    #ifdef _CORE_H_
    core->on_path();
    #endif

    ui->doubleSpinBox->setValue(REWARD_PATH);
}

void MainWindow::on_actionTarget_triggered()
{
    #ifdef _CORE_H_
    core->on_target();
    #endif

    ui->doubleSpinBox->setValue(REWARD_TARGET);
}

void MainWindow::on_actionSource_triggered()
{
    #ifdef _CORE_H_
    core->on_source();
    #endif

    ui->doubleSpinBox->setValue(REWARD_SOURCE);
}

void MainWindow::on_actionDestination_triggered()
{
    #ifdef _CORE_H_
    core->on_destination();
    #endif

    ui->doubleSpinBox->setValue(REWARD_DESTINATION);
}
