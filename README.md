Contents:
=================
* Overview
* Layers

Overview
=================
This document includes the description of the main repo features.

Layers
=================

Layers functionality was designed as a small bundles, mounts on top of the DomF rootfs, providing extra features, needed for the Services.
Each layer have tar ball format and is designed to be mounted as overlay on top of the DomF rootfs and add utilities and features, needed
by Services. Layers can be shared between Services 

Layers recipe format is the following:

```bash
# If parent layer is core-image-minimal then put:
# require core-image-layer.inc
# if parent layer is another layer, then"
# require layer_recipe_name.bb
require <layer parent>

SUMMARY = "<Layer summary>"
# If parent layer is core-image-minimal, can be omited
PARENT_IMAGE = "<parent layer name>"

LAYER_FEATURES_${PN} = "<layer packages>"

IMAGE_INSTALL_append = "${LAYER_FEATURES_${PN}}"

LAYER_VERSION = "<layer version>"
```

Example: We create core-image-layer2.bb recipe on top of some core-image-layer1.bb with the following contents:

```bash
require core-image-layer1.bb

SUMMARY = "An image  board_layer2"

LAYER_FEATURES_${PN} = " \
    alsa-utils \
"

IMAGE_INSTALL_append = "${LAYER_FEATURES_${PN}}"

LAYER_VERSION = "2"
```

Build layer:

```bash
bitbake <layer name>
```

Example: Using recipe from the example above:

```bash
bitbake core-image-layer2
```

3\. Layer image tar archieve should be deployed with the following format:

```bash
<layer-name>-<machine>-bundle.tar.gz
```

Example:

```bash
core-image-layer1-armv8-xt-bundle.tar.bz2
```

Deploy directory is the following:
```bash
<domu deploy dir>/layer_bundles
```

