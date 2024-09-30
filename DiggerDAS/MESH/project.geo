// levee without burrows
lc=0.1;

Point(1) = {0, 1, 0, lc};
Point(2) = {10, 1, 0, lc};
Point(3) = {10, 0, 0, lc};
Point(4) = {10, -2.5, 0, lc};
Point(5) = {10, -3, 0, lc};
Point(6) = {0, -3, 0, lc};
Point(7) = {0, -2.5, 0, lc};
Point(8) = {0, 0, 0, lc};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(8) = {7, 8};
Line(9) = {8, 1};
Line(10) = {3, 8};
Line(11) = {4, 7};

//air layer
Line Loop(1) = {1, 2, 10, 9};
Plane Surface(1) = {1};

//clay layer
Curve Loop(2) = {-10, 3, 11, 8};
Plane Surface(2) = {2};

//sand layer
Curve Loop(3) = {-11, 4, 5, 6};
Plane Surface(3) = {3};

Recombine Surface{1, 2, 3};

// meshing
// quads mesh
//Mesh.SubdivisionAlgorithm = 1;
//Mesh.ElementOrder = 2;

//Mesh.Algorithm = 2; // frontal quad: 8;

// sizing
//Mesh.RecombinationAlgorithm = 2;
//Mesh.CharacteristicLengthFactor = 1.0;

Physical Line("Top") = {1};
Physical Line("Left") = {6, 8, 9};
Physical Line("Bottom") = {5};
Physical Line("Right") = {2, 3, 4};

Physical Surface("M1") = {1};  //air layer
Physical Surface("M2") = {2};  //clay layer
Physical Surface("M3") = {3};  // sand layer

Mesh.MshFileVersion = 2.2;