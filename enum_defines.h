#ifndef ENUM_DEFINES_H
#define ENUM_DEFINES_H

#include <QObject>
class EnumDefines : public QObject
{
    Q_OBJECT

public:

    enum PageType {
        Pageone = 1,
        Pagetwo = 2,
        Pagethree = 3
    };
    Q_ENUM(PageType)



    explicit EnumDefines(QObject *parent = nullptr) : QObject(parent) {}
};

#endif // ENUM_DEFINES_H
