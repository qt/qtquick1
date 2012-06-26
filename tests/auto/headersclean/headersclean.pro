QT = core testlib gui quick1
HEADERSCLEAN_PRI = $${QT.core.sources}/../../tests/auto/other/headersclean/headersclean.pri
isEmpty(QT.core.sources)|!include($$HEADERSCLEAN_PRI) {
    warning("headersclean.pri from QtCore sources not available.  test disabled")
    TEMPLATE=subdirs
}
