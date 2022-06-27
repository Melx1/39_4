#include <QApplication>
#include <QWidget>
#include <QLineEdit>
#include <QLabel>
#include <QLayout>
#include <QRegularExpression>
#include <QObject>

class MyWidget: public QWidget {
    Q_OBJECT

public:
    explicit MyWidget(QWidget* parent = nullptr);

private:
    QLayout* layout;
    QLineEdit* lineEdit;
    QLabel* label;
};

MyWidget::MyWidget(QWidget *parent) : QWidget(parent) {
    setMinimumSize({640, 480});

    lineEdit = new QLineEdit(this);
    lineEdit->setSizePolicy(QSizePolicy::Ignored, QSizePolicy::Fixed);
    lineEdit->setText("Input phone number");

    label = new QLabel(this);
    label->setText("result");
    label->setAlignment(Qt::AlignCenter);

    label->setStyleSheet("QLabel {"
                         "background-color : darkgrey; "
                         "color : red; "
                         "font-size: 18pt;"
                         "}");

    layout = new QVBoxLayout(this);
    layout->addWidget(lineEdit);
    layout->addWidget(label);

    QObject::connect(lineEdit, &QLineEdit::textEdited, [this](const QString& currentText) mutable {
        QRegularExpression re("^\\+\\d{11}$");
        if(re.match(currentText).hasMatch()) {
            this->label->setText("Ok");
            this->label->setStyleSheet("QLabel {"
                                       "background-color : darkgrey; "
                                       "color : green; "
                                       "font-size: 18pt;"
                                       "}");
        }
        else {
            this->label->setText("Not Ok");
            this->label->setStyleSheet("QLabel {"
                                       "background-color : darkgrey; "
                                       "color : red; "
                                       "font-size: 18pt;"
                                       "}");
        }
    });
}

int main(int argc, char* argv[]) {
    QApplication a(argc, argv);
    auto* mainWidget = new MyWidget();
    mainWidget->show();
    return QApplication::exec();
}

#include "main.moc"