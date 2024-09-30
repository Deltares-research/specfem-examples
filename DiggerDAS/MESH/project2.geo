// square
lc=0.01;

Point(1) = {0, 1, 0, lc};
Point(2) = {10, 1, 0, lc};
Point(3) = {10, 0, 0, lc};
Point(4) = {10, -3, 0, lc};
Point(5) = {5.25, -3, 0, lc};
Point(6) = {5.25, -2, 0, lc};
Point(7) = {5.25, -1.25, 0, lc};
Point(8) = {5.0, -1.25, 0, lc};
Point(9) = {4.75, -1.25, 0, lc};
Point(10) = {4.75, -2, 0, lc};
Point(11) = {4.75, -3, 0, lc};
Point(12) = {0, -3, 0, lc};
Point(13) = {0, 0, 0, lc};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {10, 6};
Line(8) = {5, 11};
Line(9) = {9, 10};
Line(10) = {10, 11};
Line(11) = {11, 12};
Line(12) = {12, 13};
Line(13) = {13, 1};
Line(14) = {3, 13};

Circle(15) = {7, 8, 9};

Curve Loop(1) = {1, 2, 14, 13};
Curve Loop(2) = {-14, 3, 4, 5, 6, 15, 9, 10, 11, 12};
//Curve Loop(3) = {5, -7, 10, -8};
Curve Loop(3) = {7, -5, 8, -10};
//Curve Loop(4) = {6, 15, 9, 7};
Curve Loop(4) = {-15, -6, -7, -9};

Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};

Recombine Surface{1, 2, 3, 4};

// meshing
// quads mesh
Mesh.SubdivisionAlgorithm = 1;
Mesh.ElementOrder = 2;

//Mesh.Algorithm = 2; // frontal quad: 8;

// sizing
//Mesh.RecombinationAlgorithm = 2;
//Mesh.CharacteristicLengthFactor = 0.8;

Physical Line("Top") = {1};
Physical Line("Left") = {12, 13};
Physical Line("Bottom") = {4, 8, 11};
Physical Line("Right") = {2, 3};

Physical Surface("M1") = {1};
Physical Surface("M2") = {2};
Physical Surface("M3") = {3};
Physical Surface("M4") = {4};