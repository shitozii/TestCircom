pragma circom 2.0.0;

include "../node_modules/circomlib-ml/circuits/Flatten2D.circom";
include "../node_modules/circomlib-ml/circuits/MaxPooling2D.circom";
include "../node_modules/circomlib-ml/circuits/Conv2D.circom";
include "../node_modules/circomlib-ml/circuits/Dense.circom";
include "../node_modules/circomlib-ml/circuits/ArgMax.circom";
include "../node_modules/circomlib-ml/circuits/BatchNormalization2D.circom";
include "../node_modules/circomlib-ml/circuits/ReLU.circom";

template Model() {
signal input in[96][96][1];
signal input conv2d_5_weights[3][3][1][32];
signal input conv2d_5_bias[32];
signal input conv2d_5_out[94][94][32];
signal input conv2d_5_remainder[94][94][32];
signal input conv2d_5_re_lu_out[94][94][32];
signal input max_pooling2d_5_out[47][47][32];
signal input batch_normalization_5_a[32];
signal input batch_normalization_5_b[32];
signal input batch_normalization_5_out[47][47][32];
signal input batch_normalization_5_remainder[47][47][32];
signal input conv2d_6_weights[3][3][32][64];
signal input conv2d_6_bias[64];
signal input conv2d_6_out[45][45][64];
signal input conv2d_6_remainder[45][45][64];
signal input conv2d_6_re_lu_out[45][45][64];
signal input max_pooling2d_6_out[22][22][64];
signal input batch_normalization_6_a[64];
signal input batch_normalization_6_b[64];
signal input batch_normalization_6_out[22][22][64];
signal input batch_normalization_6_remainder[22][22][64];
signal input conv2d_7_weights[3][3][64][64];
signal input conv2d_7_bias[64];
signal input conv2d_7_out[20][20][64];
signal input conv2d_7_remainder[20][20][64];
signal input conv2d_7_re_lu_out[20][20][64];
signal input max_pooling2d_7_out[10][10][64];
signal input batch_normalization_7_a[64];
signal input batch_normalization_7_b[64];
signal input batch_normalization_7_out[10][10][64];
signal input batch_normalization_7_remainder[10][10][64];
signal input conv2d_8_weights[3][3][64][96];
signal input conv2d_8_bias[96];
signal input conv2d_8_out[8][8][96];
signal input conv2d_8_remainder[8][8][96];
signal input conv2d_8_re_lu_out[8][8][96];
signal input max_pooling2d_8_out[4][4][96];
signal input batch_normalization_8_a[96];
signal input batch_normalization_8_b[96];
signal input batch_normalization_8_out[4][4][96];
signal input batch_normalization_8_remainder[4][4][96];
signal input conv2d_9_weights[3][3][96][32];
signal input conv2d_9_bias[32];
signal input conv2d_9_out[2][2][32];
signal input conv2d_9_remainder[2][2][32];
signal input conv2d_9_re_lu_out[2][2][32];
signal input max_pooling2d_9_out[1][1][32];
signal input batch_normalization_9_a[32];
signal input batch_normalization_9_b[32];
signal input batch_normalization_9_out[1][1][32];
signal input batch_normalization_9_remainder[1][1][32];
signal input flatten_1_out[32];
signal input dense_2_weights[32][128];
signal input dense_2_bias[128];
signal input dense_2_out[128];
signal input dense_2_remainder[128];
signal input dense_3_weights[128][2];
signal input dense_3_bias[2];
signal input dense_3_out[2];
signal input dense_3_remainder[2];
signal input dense_3_softmax_out[1];
signal output out[1];

component conv2d_5 = Conv2D(96, 96, 1, 32, 3, 1, 10**18);
component conv2d_5_re_lu[94][94][32];
for (var i0 = 0; i0 < 94; i0++) {
    for (var i1 = 0; i1 < 94; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_5_re_lu[i0][i1][i2] = ReLU();
}}}
component max_pooling2d_5 = MaxPooling2D(94, 94, 32, 2, 2);
component batch_normalization_5 = BatchNormalization2D(47, 47, 32, 10**18);
component conv2d_6 = Conv2D(47, 47, 32, 64, 3, 1, 10**18);
component conv2d_6_re_lu[45][45][64];
for (var i0 = 0; i0 < 45; i0++) {
    for (var i1 = 0; i1 < 45; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_6_re_lu[i0][i1][i2] = ReLU();
}}}
component max_pooling2d_6 = MaxPooling2D(45, 45, 64, 2, 2);
component batch_normalization_6 = BatchNormalization2D(22, 22, 64, 10**18);
component conv2d_7 = Conv2D(22, 22, 64, 64, 3, 1, 10**18);
component conv2d_7_re_lu[20][20][64];
for (var i0 = 0; i0 < 20; i0++) {
    for (var i1 = 0; i1 < 20; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_7_re_lu[i0][i1][i2] = ReLU();
}}}
component max_pooling2d_7 = MaxPooling2D(20, 20, 64, 2, 2);
component batch_normalization_7 = BatchNormalization2D(10, 10, 64, 10**18);
component conv2d_8 = Conv2D(10, 10, 64, 96, 3, 1, 10**18);
component conv2d_8_re_lu[8][8][96];
for (var i0 = 0; i0 < 8; i0++) {
    for (var i1 = 0; i1 < 8; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            conv2d_8_re_lu[i0][i1][i2] = ReLU();
}}}
component max_pooling2d_8 = MaxPooling2D(8, 8, 96, 2, 2);
component batch_normalization_8 = BatchNormalization2D(4, 4, 96, 10**18);
component conv2d_9 = Conv2D(4, 4, 96, 32, 3, 1, 10**18);
component conv2d_9_re_lu[2][2][32];
for (var i0 = 0; i0 < 2; i0++) {
    for (var i1 = 0; i1 < 2; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_9_re_lu[i0][i1][i2] = ReLU();
}}}
component max_pooling2d_9 = MaxPooling2D(2, 2, 32, 2, 2);
component batch_normalization_9 = BatchNormalization2D(1, 1, 32, 10**18);
component flatten_1 = Flatten2D(1, 1, 32);
component dense_2 = Dense(32, 128, 10**18);
component dense_3 = Dense(128, 2, 10**18);
component dense_3_softmax = ArgMax(2);

for (var i0 = 0; i0 < 96; i0++) {
    for (var i1 = 0; i1 < 96; i1++) {
        for (var i2 = 0; i2 < 1; i2++) {
            conv2d_5.in[i0][i1][i2] <== in[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 3; i0++) {
    for (var i1 = 0; i1 < 3; i1++) {
        for (var i2 = 0; i2 < 1; i2++) {
            for (var i3 = 0; i3 < 32; i3++) {
                conv2d_5.weights[i0][i1][i2][i3] <== conv2d_5_weights[i0][i1][i2][i3];
}}}}
for (var i0 = 0; i0 < 32; i0++) {
    conv2d_5.bias[i0] <== conv2d_5_bias[i0];
}
for (var i0 = 0; i0 < 94; i0++) {
    for (var i1 = 0; i1 < 94; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_5.out[i0][i1][i2] <== conv2d_5_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 94; i0++) {
    for (var i1 = 0; i1 < 94; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_5.remainder[i0][i1][i2] <== conv2d_5_remainder[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 94; i0++) {
    for (var i1 = 0; i1 < 94; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_5_re_lu[i0][i1][i2].in <== conv2d_5.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 94; i0++) {
    for (var i1 = 0; i1 < 94; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_5_re_lu[i0][i1][i2].out <== conv2d_5_re_lu_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 94; i0++) {
    for (var i1 = 0; i1 < 94; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            max_pooling2d_5.in[i0][i1][i2] <== conv2d_5_re_lu[i0][i1][i2].out;
}}}
for (var i0 = 0; i0 < 47; i0++) {
    for (var i1 = 0; i1 < 47; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            max_pooling2d_5.out[i0][i1][i2] <== max_pooling2d_5_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 47; i0++) {
    for (var i1 = 0; i1 < 47; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            batch_normalization_5.in[i0][i1][i2] <== max_pooling2d_5.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 32; i0++) {
    batch_normalization_5.a[i0] <== batch_normalization_5_a[i0];
}
for (var i0 = 0; i0 < 32; i0++) {
    batch_normalization_5.b[i0] <== batch_normalization_5_b[i0];
}
for (var i0 = 0; i0 < 47; i0++) {
    for (var i1 = 0; i1 < 47; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            batch_normalization_5.out[i0][i1][i2] <== batch_normalization_5_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 47; i0++) {
    for (var i1 = 0; i1 < 47; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            batch_normalization_5.remainder[i0][i1][i2] <== batch_normalization_5_remainder[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 47; i0++) {
    for (var i1 = 0; i1 < 47; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_6.in[i0][i1][i2] <== batch_normalization_5.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 3; i0++) {
    for (var i1 = 0; i1 < 3; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            for (var i3 = 0; i3 < 64; i3++) {
                conv2d_6.weights[i0][i1][i2][i3] <== conv2d_6_weights[i0][i1][i2][i3];
}}}}
for (var i0 = 0; i0 < 64; i0++) {
    conv2d_6.bias[i0] <== conv2d_6_bias[i0];
}
for (var i0 = 0; i0 < 45; i0++) {
    for (var i1 = 0; i1 < 45; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_6.out[i0][i1][i2] <== conv2d_6_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 45; i0++) {
    for (var i1 = 0; i1 < 45; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_6.remainder[i0][i1][i2] <== conv2d_6_remainder[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 45; i0++) {
    for (var i1 = 0; i1 < 45; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_6_re_lu[i0][i1][i2].in <== conv2d_6.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 45; i0++) {
    for (var i1 = 0; i1 < 45; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_6_re_lu[i0][i1][i2].out <== conv2d_6_re_lu_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 45; i0++) {
    for (var i1 = 0; i1 < 45; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            max_pooling2d_6.in[i0][i1][i2] <== conv2d_6_re_lu[i0][i1][i2].out;
}}}
for (var i0 = 0; i0 < 22; i0++) {
    for (var i1 = 0; i1 < 22; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            max_pooling2d_6.out[i0][i1][i2] <== max_pooling2d_6_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 22; i0++) {
    for (var i1 = 0; i1 < 22; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            batch_normalization_6.in[i0][i1][i2] <== max_pooling2d_6.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 64; i0++) {
    batch_normalization_6.a[i0] <== batch_normalization_6_a[i0];
}
for (var i0 = 0; i0 < 64; i0++) {
    batch_normalization_6.b[i0] <== batch_normalization_6_b[i0];
}
for (var i0 = 0; i0 < 22; i0++) {
    for (var i1 = 0; i1 < 22; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            batch_normalization_6.out[i0][i1][i2] <== batch_normalization_6_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 22; i0++) {
    for (var i1 = 0; i1 < 22; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            batch_normalization_6.remainder[i0][i1][i2] <== batch_normalization_6_remainder[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 22; i0++) {
    for (var i1 = 0; i1 < 22; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_7.in[i0][i1][i2] <== batch_normalization_6.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 3; i0++) {
    for (var i1 = 0; i1 < 3; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            for (var i3 = 0; i3 < 64; i3++) {
                conv2d_7.weights[i0][i1][i2][i3] <== conv2d_7_weights[i0][i1][i2][i3];
}}}}
for (var i0 = 0; i0 < 64; i0++) {
    conv2d_7.bias[i0] <== conv2d_7_bias[i0];
}
for (var i0 = 0; i0 < 20; i0++) {
    for (var i1 = 0; i1 < 20; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_7.out[i0][i1][i2] <== conv2d_7_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 20; i0++) {
    for (var i1 = 0; i1 < 20; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_7.remainder[i0][i1][i2] <== conv2d_7_remainder[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 20; i0++) {
    for (var i1 = 0; i1 < 20; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_7_re_lu[i0][i1][i2].in <== conv2d_7.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 20; i0++) {
    for (var i1 = 0; i1 < 20; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_7_re_lu[i0][i1][i2].out <== conv2d_7_re_lu_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 20; i0++) {
    for (var i1 = 0; i1 < 20; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            max_pooling2d_7.in[i0][i1][i2] <== conv2d_7_re_lu[i0][i1][i2].out;
}}}
for (var i0 = 0; i0 < 10; i0++) {
    for (var i1 = 0; i1 < 10; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            max_pooling2d_7.out[i0][i1][i2] <== max_pooling2d_7_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 10; i0++) {
    for (var i1 = 0; i1 < 10; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            batch_normalization_7.in[i0][i1][i2] <== max_pooling2d_7.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 64; i0++) {
    batch_normalization_7.a[i0] <== batch_normalization_7_a[i0];
}
for (var i0 = 0; i0 < 64; i0++) {
    batch_normalization_7.b[i0] <== batch_normalization_7_b[i0];
}
for (var i0 = 0; i0 < 10; i0++) {
    for (var i1 = 0; i1 < 10; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            batch_normalization_7.out[i0][i1][i2] <== batch_normalization_7_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 10; i0++) {
    for (var i1 = 0; i1 < 10; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            batch_normalization_7.remainder[i0][i1][i2] <== batch_normalization_7_remainder[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 10; i0++) {
    for (var i1 = 0; i1 < 10; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            conv2d_8.in[i0][i1][i2] <== batch_normalization_7.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 3; i0++) {
    for (var i1 = 0; i1 < 3; i1++) {
        for (var i2 = 0; i2 < 64; i2++) {
            for (var i3 = 0; i3 < 96; i3++) {
                conv2d_8.weights[i0][i1][i2][i3] <== conv2d_8_weights[i0][i1][i2][i3];
}}}}
for (var i0 = 0; i0 < 96; i0++) {
    conv2d_8.bias[i0] <== conv2d_8_bias[i0];
}
for (var i0 = 0; i0 < 8; i0++) {
    for (var i1 = 0; i1 < 8; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            conv2d_8.out[i0][i1][i2] <== conv2d_8_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 8; i0++) {
    for (var i1 = 0; i1 < 8; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            conv2d_8.remainder[i0][i1][i2] <== conv2d_8_remainder[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 8; i0++) {
    for (var i1 = 0; i1 < 8; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            conv2d_8_re_lu[i0][i1][i2].in <== conv2d_8.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 8; i0++) {
    for (var i1 = 0; i1 < 8; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            conv2d_8_re_lu[i0][i1][i2].out <== conv2d_8_re_lu_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 8; i0++) {
    for (var i1 = 0; i1 < 8; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            max_pooling2d_8.in[i0][i1][i2] <== conv2d_8_re_lu[i0][i1][i2].out;
}}}
for (var i0 = 0; i0 < 4; i0++) {
    for (var i1 = 0; i1 < 4; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            max_pooling2d_8.out[i0][i1][i2] <== max_pooling2d_8_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 4; i0++) {
    for (var i1 = 0; i1 < 4; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            batch_normalization_8.in[i0][i1][i2] <== max_pooling2d_8.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 96; i0++) {
    batch_normalization_8.a[i0] <== batch_normalization_8_a[i0];
}
for (var i0 = 0; i0 < 96; i0++) {
    batch_normalization_8.b[i0] <== batch_normalization_8_b[i0];
}
for (var i0 = 0; i0 < 4; i0++) {
    for (var i1 = 0; i1 < 4; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            batch_normalization_8.out[i0][i1][i2] <== batch_normalization_8_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 4; i0++) {
    for (var i1 = 0; i1 < 4; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            batch_normalization_8.remainder[i0][i1][i2] <== batch_normalization_8_remainder[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 4; i0++) {
    for (var i1 = 0; i1 < 4; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            conv2d_9.in[i0][i1][i2] <== batch_normalization_8.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 3; i0++) {
    for (var i1 = 0; i1 < 3; i1++) {
        for (var i2 = 0; i2 < 96; i2++) {
            for (var i3 = 0; i3 < 32; i3++) {
                conv2d_9.weights[i0][i1][i2][i3] <== conv2d_9_weights[i0][i1][i2][i3];
}}}}
for (var i0 = 0; i0 < 32; i0++) {
    conv2d_9.bias[i0] <== conv2d_9_bias[i0];
}
for (var i0 = 0; i0 < 2; i0++) {
    for (var i1 = 0; i1 < 2; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_9.out[i0][i1][i2] <== conv2d_9_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 2; i0++) {
    for (var i1 = 0; i1 < 2; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_9.remainder[i0][i1][i2] <== conv2d_9_remainder[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 2; i0++) {
    for (var i1 = 0; i1 < 2; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_9_re_lu[i0][i1][i2].in <== conv2d_9.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 2; i0++) {
    for (var i1 = 0; i1 < 2; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            conv2d_9_re_lu[i0][i1][i2].out <== conv2d_9_re_lu_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 2; i0++) {
    for (var i1 = 0; i1 < 2; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            max_pooling2d_9.in[i0][i1][i2] <== conv2d_9_re_lu[i0][i1][i2].out;
}}}
for (var i0 = 0; i0 < 1; i0++) {
    for (var i1 = 0; i1 < 1; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            max_pooling2d_9.out[i0][i1][i2] <== max_pooling2d_9_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 1; i0++) {
    for (var i1 = 0; i1 < 1; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            batch_normalization_9.in[i0][i1][i2] <== max_pooling2d_9.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 32; i0++) {
    batch_normalization_9.a[i0] <== batch_normalization_9_a[i0];
}
for (var i0 = 0; i0 < 32; i0++) {
    batch_normalization_9.b[i0] <== batch_normalization_9_b[i0];
}
for (var i0 = 0; i0 < 1; i0++) {
    for (var i1 = 0; i1 < 1; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            batch_normalization_9.out[i0][i1][i2] <== batch_normalization_9_out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 1; i0++) {
    for (var i1 = 0; i1 < 1; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            batch_normalization_9.remainder[i0][i1][i2] <== batch_normalization_9_remainder[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 1; i0++) {
    for (var i1 = 0; i1 < 1; i1++) {
        for (var i2 = 0; i2 < 32; i2++) {
            flatten_1.in[i0][i1][i2] <== batch_normalization_9.out[i0][i1][i2];
}}}
for (var i0 = 0; i0 < 32; i0++) {
    flatten_1.out[i0] <== flatten_1_out[i0];
}
for (var i0 = 0; i0 < 32; i0++) {
    dense_2.in[i0] <== flatten_1.out[i0];
}
for (var i0 = 0; i0 < 32; i0++) {
    for (var i1 = 0; i1 < 128; i1++) {
        dense_2.weights[i0][i1] <== dense_2_weights[i0][i1];
}}
for (var i0 = 0; i0 < 128; i0++) {
    dense_2.bias[i0] <== dense_2_bias[i0];
}
for (var i0 = 0; i0 < 128; i0++) {
    dense_2.out[i0] <== dense_2_out[i0];
}
for (var i0 = 0; i0 < 128; i0++) {
    dense_2.remainder[i0] <== dense_2_remainder[i0];
}
for (var i0 = 0; i0 < 128; i0++) {
    dense_3.in[i0] <== dense_2.out[i0];
}
for (var i0 = 0; i0 < 128; i0++) {
    for (var i1 = 0; i1 < 2; i1++) {
        dense_3.weights[i0][i1] <== dense_3_weights[i0][i1];
}}
for (var i0 = 0; i0 < 2; i0++) {
    dense_3.bias[i0] <== dense_3_bias[i0];
}
for (var i0 = 0; i0 < 2; i0++) {
    dense_3.out[i0] <== dense_3_out[i0];
}
for (var i0 = 0; i0 < 2; i0++) {
    dense_3.remainder[i0] <== dense_3_remainder[i0];
}
for (var i0 = 0; i0 < 2; i0++) {
    dense_3_softmax.in[i0] <== dense_3.out[i0];
}
dense_3_softmax.out <== dense_3_softmax_out[0];
out[0] <== dense_3_softmax.out;

}

component main = Model();
