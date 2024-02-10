pragma circom 2.0.0;

include "../node_modules/circomlib-ml/circuits/Flatten2D.circom";
include "../node_modules/circomlib-ml/circuits/MaxPooling2D.circom";
include "../node_modules/circomlib-ml/circuits/Conv2D.circom";
include "../node_modules/circomlib-ml/circuits/Dense.circom";
include "../node_modules/circomlib-ml/circuits/ArgMax.circom";
include "../node_modules/circomlib-ml/circuits/BatchNormalization2D.circom";
include "../node_modules/circomlib-ml/circuits/ReLU.circom";

template Model() {
signal input in[94][94][32];
signal input max_pooling2d_5_out[47][47][32];
signal output out[47][47][32];
component max_pooling2d_5 = MaxPooling2D(94, 94, 32, 2, 2);
for (var i0 = 0; i0 < 94; i0++) {
    for (var i1 = 0; i1 < 94; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            max_pooling2d_5.in[i0][i1][i2] <== in[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 47; i0++) {
    for (var i1 = 0; i1 < 47; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            max_pooling2d_5.out[i0][i1][i2] <== max_pooling2d_5_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 47; i0++) {
    for (var i1 = 0; i1 < 47; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            out[i0][i1][i2] <== max_pooling2d_5.out[i0][i1][i2];
}}}
}
component main = Model();