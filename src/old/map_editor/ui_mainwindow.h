/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.2.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDoubleSpinBox>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionOpen;
    QAction *actionSave;
    QAction *actionSave_as;
    QAction *actionClose;
    QAction *actionDelete;
    QAction *actionWall;
    QAction *actionRed_robot;
    QAction *actionRed_target;
    QAction *actionRed_path;
    QAction *actionGreen_robot;
    QAction *actionGreen_target;
    QAction *actionGreen_path;
    QAction *actionBlue_robot;
    QAction *actionBlue_target;
    QAction *actionBlue_path;
    QAction *actionPath;
    QAction *actionTarget;
    QAction *actionSource;
    QAction *actionDestination;
    QAction *actionNew;
    QWidget *centralWidget;
    QWidget *verticalLayoutWidget;
    QVBoxLayout *verticalLayout;
    QPushButton *pushButton;
    QPushButton *pushButton_2;
    QPushButton *pushButton_3;
    QPushButton *pushButton_5;
    QPushButton *pushButton_4;
    QWidget *verticalLayoutWidget_2;
    QVBoxLayout *verticalLayout_2;
    QPushButton *pushButton_9;
    QPushButton *pushButton_8;
    QPushButton *pushButton_6;
    QPushButton *pushButton_7;
    QWidget *formLayoutWidget;
    QFormLayout *formLayout;
    QLabel *label;
    QLabel *label_2;
    QDoubleSpinBox *doubleSpinBox;
    QSpinBox *spinBox;
    QDoubleSpinBox *doubleSpinBox_2;
    QLabel *label_3;
    QMenuBar *menuBar;
    QMenu *menuMap_editor;
    QMenu *menuTools;
    QMenu *menuRed_team;
    QMenu *menuGreen_team;
    QMenu *menuBlue_team;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;
    QToolBar *toolBar;
    QToolBar *toolBar_2;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->setWindowModality(Qt::NonModal);
        MainWindow->setEnabled(true);
        MainWindow->resize(800, 525);
        MainWindow->setMaximumSize(QSize(800, 600));
        MainWindow->setBaseSize(QSize(800, 600));
        actionOpen = new QAction(MainWindow);
        actionOpen->setObjectName(QStringLiteral("actionOpen"));
        actionSave = new QAction(MainWindow);
        actionSave->setObjectName(QStringLiteral("actionSave"));
        actionSave_as = new QAction(MainWindow);
        actionSave_as->setObjectName(QStringLiteral("actionSave_as"));
        actionClose = new QAction(MainWindow);
        actionClose->setObjectName(QStringLiteral("actionClose"));
        actionDelete = new QAction(MainWindow);
        actionDelete->setObjectName(QStringLiteral("actionDelete"));
        actionWall = new QAction(MainWindow);
        actionWall->setObjectName(QStringLiteral("actionWall"));
        actionRed_robot = new QAction(MainWindow);
        actionRed_robot->setObjectName(QStringLiteral("actionRed_robot"));
        actionRed_target = new QAction(MainWindow);
        actionRed_target->setObjectName(QStringLiteral("actionRed_target"));
        actionRed_path = new QAction(MainWindow);
        actionRed_path->setObjectName(QStringLiteral("actionRed_path"));
        actionGreen_robot = new QAction(MainWindow);
        actionGreen_robot->setObjectName(QStringLiteral("actionGreen_robot"));
        actionGreen_target = new QAction(MainWindow);
        actionGreen_target->setObjectName(QStringLiteral("actionGreen_target"));
        actionGreen_path = new QAction(MainWindow);
        actionGreen_path->setObjectName(QStringLiteral("actionGreen_path"));
        actionBlue_robot = new QAction(MainWindow);
        actionBlue_robot->setObjectName(QStringLiteral("actionBlue_robot"));
        actionBlue_target = new QAction(MainWindow);
        actionBlue_target->setObjectName(QStringLiteral("actionBlue_target"));
        actionBlue_path = new QAction(MainWindow);
        actionBlue_path->setObjectName(QStringLiteral("actionBlue_path"));
        actionPath = new QAction(MainWindow);
        actionPath->setObjectName(QStringLiteral("actionPath"));
        actionTarget = new QAction(MainWindow);
        actionTarget->setObjectName(QStringLiteral("actionTarget"));
        actionSource = new QAction(MainWindow);
        actionSource->setObjectName(QStringLiteral("actionSource"));
        actionDestination = new QAction(MainWindow);
        actionDestination->setObjectName(QStringLiteral("actionDestination"));
        actionNew = new QAction(MainWindow);
        actionNew->setObjectName(QStringLiteral("actionNew"));
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        verticalLayoutWidget = new QWidget(centralWidget);
        verticalLayoutWidget->setObjectName(QStringLiteral("verticalLayoutWidget"));
        verticalLayoutWidget->setGeometry(QRect(680, 0, 111, 171));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setSpacing(6);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        pushButton = new QPushButton(verticalLayoutWidget);
        pushButton->setObjectName(QStringLiteral("pushButton"));

        verticalLayout->addWidget(pushButton);

        pushButton_2 = new QPushButton(verticalLayoutWidget);
        pushButton_2->setObjectName(QStringLiteral("pushButton_2"));

        verticalLayout->addWidget(pushButton_2);

        pushButton_3 = new QPushButton(verticalLayoutWidget);
        pushButton_3->setObjectName(QStringLiteral("pushButton_3"));

        verticalLayout->addWidget(pushButton_3);

        pushButton_5 = new QPushButton(verticalLayoutWidget);
        pushButton_5->setObjectName(QStringLiteral("pushButton_5"));

        verticalLayout->addWidget(pushButton_5);

        pushButton_4 = new QPushButton(verticalLayoutWidget);
        pushButton_4->setObjectName(QStringLiteral("pushButton_4"));

        verticalLayout->addWidget(pushButton_4);

        verticalLayoutWidget_2 = new QWidget(centralWidget);
        verticalLayoutWidget_2->setObjectName(QStringLiteral("verticalLayoutWidget_2"));
        verticalLayoutWidget_2->setGeometry(QRect(680, 180, 111, 141));
        verticalLayout_2 = new QVBoxLayout(verticalLayoutWidget_2);
        verticalLayout_2->setSpacing(6);
        verticalLayout_2->setContentsMargins(11, 11, 11, 11);
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        verticalLayout_2->setContentsMargins(0, 0, 0, 0);
        pushButton_9 = new QPushButton(verticalLayoutWidget_2);
        pushButton_9->setObjectName(QStringLiteral("pushButton_9"));

        verticalLayout_2->addWidget(pushButton_9);

        pushButton_8 = new QPushButton(verticalLayoutWidget_2);
        pushButton_8->setObjectName(QStringLiteral("pushButton_8"));

        verticalLayout_2->addWidget(pushButton_8);

        pushButton_6 = new QPushButton(verticalLayoutWidget_2);
        pushButton_6->setObjectName(QStringLiteral("pushButton_6"));

        verticalLayout_2->addWidget(pushButton_6);

        pushButton_7 = new QPushButton(verticalLayoutWidget_2);
        pushButton_7->setObjectName(QStringLiteral("pushButton_7"));

        verticalLayout_2->addWidget(pushButton_7);

        formLayoutWidget = new QWidget(centralWidget);
        formLayoutWidget->setObjectName(QStringLiteral("formLayoutWidget"));
        formLayoutWidget->setGeometry(QRect(20, 360, 271, 101));
        formLayout = new QFormLayout(formLayoutWidget);
        formLayout->setSpacing(6);
        formLayout->setContentsMargins(11, 11, 11, 11);
        formLayout->setObjectName(QStringLiteral("formLayout"));
        formLayout->setContentsMargins(0, 0, 0, 0);
        label = new QLabel(formLayoutWidget);
        label->setObjectName(QStringLiteral("label"));

        formLayout->setWidget(0, QFormLayout::LabelRole, label);

        label_2 = new QLabel(formLayoutWidget);
        label_2->setObjectName(QStringLiteral("label_2"));

        formLayout->setWidget(1, QFormLayout::LabelRole, label_2);

        doubleSpinBox = new QDoubleSpinBox(formLayoutWidget);
        doubleSpinBox->setObjectName(QStringLiteral("doubleSpinBox"));
        doubleSpinBox->setDecimals(5);
        doubleSpinBox->setMinimum(-10);
        doubleSpinBox->setMaximum(10);

        formLayout->setWidget(0, QFormLayout::FieldRole, doubleSpinBox);

        spinBox = new QSpinBox(formLayoutWidget);
        spinBox->setObjectName(QStringLiteral("spinBox"));
        spinBox->setMinimum(-1000000000);
        spinBox->setMaximum(1000000000);

        formLayout->setWidget(1, QFormLayout::FieldRole, spinBox);

        doubleSpinBox_2 = new QDoubleSpinBox(formLayoutWidget);
        doubleSpinBox_2->setObjectName(QStringLiteral("doubleSpinBox_2"));
        doubleSpinBox_2->setDecimals(5);
        doubleSpinBox_2->setMinimum(-1e+07);
        doubleSpinBox_2->setMaximum(1e+07);
        doubleSpinBox_2->setValue(0);

        formLayout->setWidget(2, QFormLayout::FieldRole, doubleSpinBox_2);

        label_3 = new QLabel(formLayoutWidget);
        label_3->setObjectName(QStringLiteral("label_3"));

        formLayout->setWidget(2, QFormLayout::LabelRole, label_3);

        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 800, 25));
        menuMap_editor = new QMenu(menuBar);
        menuMap_editor->setObjectName(QStringLiteral("menuMap_editor"));
        menuTools = new QMenu(menuBar);
        menuTools->setObjectName(QStringLiteral("menuTools"));
        menuRed_team = new QMenu(menuTools);
        menuRed_team->setObjectName(QStringLiteral("menuRed_team"));
        menuGreen_team = new QMenu(menuTools);
        menuGreen_team->setObjectName(QStringLiteral("menuGreen_team"));
        menuBlue_team = new QMenu(menuTools);
        menuBlue_team->setObjectName(QStringLiteral("menuBlue_team"));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);
        toolBar = new QToolBar(MainWindow);
        toolBar->setObjectName(QStringLiteral("toolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, toolBar);
        toolBar_2 = new QToolBar(MainWindow);
        toolBar_2->setObjectName(QStringLiteral("toolBar_2"));
        MainWindow->addToolBar(Qt::TopToolBarArea, toolBar_2);

        menuBar->addAction(menuMap_editor->menuAction());
        menuBar->addAction(menuTools->menuAction());
        menuMap_editor->addAction(actionNew);
        menuMap_editor->addAction(actionOpen);
        menuMap_editor->addAction(actionSave);
        menuMap_editor->addAction(actionSave_as);
        menuMap_editor->addSeparator();
        menuMap_editor->addAction(actionClose);
        menuTools->addAction(actionDelete);
        menuTools->addAction(actionWall);
        menuTools->addAction(menuRed_team->menuAction());
        menuTools->addAction(menuGreen_team->menuAction());
        menuTools->addAction(menuBlue_team->menuAction());
        menuTools->addAction(actionPath);
        menuTools->addAction(actionTarget);
        menuTools->addAction(actionSource);
        menuTools->addAction(actionDestination);
        menuRed_team->addAction(actionRed_robot);
        menuRed_team->addAction(actionRed_target);
        menuRed_team->addAction(actionRed_path);
        menuGreen_team->addAction(actionGreen_robot);
        menuGreen_team->addAction(actionGreen_target);
        menuGreen_team->addAction(actionGreen_path);
        menuBlue_team->addAction(actionBlue_robot);
        menuBlue_team->addAction(actionBlue_target);
        menuBlue_team->addAction(actionBlue_path);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "Map editor", 0));
        actionOpen->setText(QApplication::translate("MainWindow", "Open", 0));
        actionOpen->setShortcut(QApplication::translate("MainWindow", "Ctrl+O", 0));
        actionSave->setText(QApplication::translate("MainWindow", "Save", 0));
        actionSave->setShortcut(QApplication::translate("MainWindow", "Ctrl+S", 0));
        actionSave_as->setText(QApplication::translate("MainWindow", "Save as", 0));
        actionClose->setText(QApplication::translate("MainWindow", "Close", 0));
        actionClose->setShortcut(QApplication::translate("MainWindow", "Ctrl+Q", 0));
        actionDelete->setText(QApplication::translate("MainWindow", "Delete", 0));
        actionDelete->setShortcut(QApplication::translate("MainWindow", "Ctrl+D", 0));
        actionWall->setText(QApplication::translate("MainWindow", "Wall", 0));
        actionWall->setShortcut(QApplication::translate("MainWindow", "Ctrl+W", 0));
        actionRed_robot->setText(QApplication::translate("MainWindow", "Red robot", 0));
        actionRed_target->setText(QApplication::translate("MainWindow", "Red target", 0));
        actionRed_path->setText(QApplication::translate("MainWindow", "Red path", 0));
        actionGreen_robot->setText(QApplication::translate("MainWindow", "Green robot", 0));
        actionGreen_target->setText(QApplication::translate("MainWindow", "Green target", 0));
        actionGreen_path->setText(QApplication::translate("MainWindow", "Green path", 0));
        actionBlue_robot->setText(QApplication::translate("MainWindow", "Blue robot", 0));
        actionBlue_target->setText(QApplication::translate("MainWindow", "Blue target", 0));
        actionBlue_path->setText(QApplication::translate("MainWindow", "Blue path", 0));
        actionPath->setText(QApplication::translate("MainWindow", "Path", 0));
        actionPath->setShortcut(QApplication::translate("MainWindow", "Ctrl+P", 0));
        actionTarget->setText(QApplication::translate("MainWindow", "Target", 0));
        actionTarget->setShortcut(QApplication::translate("MainWindow", "Ctrl+T", 0));
        actionSource->setText(QApplication::translate("MainWindow", "Source", 0));
        actionSource->setShortcut(QApplication::translate("MainWindow", "S", 0));
        actionDestination->setText(QApplication::translate("MainWindow", "Destination", 0));
        actionDestination->setShortcut(QApplication::translate("MainWindow", "D", 0));
        actionNew->setText(QApplication::translate("MainWindow", "New", 0));
        pushButton->setText(QApplication::translate("MainWindow", "Delete", 0));
        pushButton_2->setText(QApplication::translate("MainWindow", "Wall", 0));
        pushButton_3->setText(QApplication::translate("MainWindow", "Red Robot", 0));
        pushButton_5->setText(QApplication::translate("MainWindow", "Green Robot", 0));
        pushButton_4->setText(QApplication::translate("MainWindow", "Blue Robot", 0));
        pushButton_9->setText(QApplication::translate("MainWindow", "Path", 0));
        pushButton_8->setText(QApplication::translate("MainWindow", "Target", 0));
        pushButton_6->setText(QApplication::translate("MainWindow", "Source", 0));
        pushButton_7->setText(QApplication::translate("MainWindow", "Destination", 0));
        label->setText(QApplication::translate("MainWindow", "Reward", 0));
        label_2->setText(QApplication::translate("MainWindow", "Int param", 0));
        label_3->setText(QApplication::translate("MainWindow", "Float param", 0));
        menuMap_editor->setTitle(QApplication::translate("MainWindow", "File", 0));
        menuTools->setTitle(QApplication::translate("MainWindow", "Tools", 0));
        menuRed_team->setTitle(QApplication::translate("MainWindow", "Red team", 0));
        menuGreen_team->setTitle(QApplication::translate("MainWindow", "Green team", 0));
        menuBlue_team->setTitle(QApplication::translate("MainWindow", "Blue team", 0));
        toolBar->setWindowTitle(QApplication::translate("MainWindow", "toolBar", 0));
        toolBar_2->setWindowTitle(QApplication::translate("MainWindow", "toolBar_2", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
