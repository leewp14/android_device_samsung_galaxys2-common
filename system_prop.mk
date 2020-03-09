
# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-filter=speed \
    dalvik.vm.image-dex2oat-filter=speed \
    ro.sys.fw.dex2oat_thread_count=2

# HWUI
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.renderer=opengl

# SurfaceFlinger
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.latch_unsignaled=1 \
    debug.sf.disable_backpressure=1
