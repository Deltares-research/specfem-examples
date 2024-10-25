// levee without beaver hole
lc=0.2;

Point(1) = {0, 3, 0, lc/2};
Point(2) = {10, 3, 0, lc/2};
Point(3) = {10, 0.5, 0, lc/2};
Point(4) = {10, 0, 0, lc};
Point(5) = {0, 0, 0, lc};
Point(6) = {0, 0.5, 0, lc/2};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};
Line(7) = {3, 6};


//clay layer
Line Loop(1) = {-1, -6, -7, -2};
Plane Surface(1) = {1};

//sand layer
Line Loop(2) = {7, -5, -4, -3};
Plane Surface(2) = {2};

Recombine Surface{1, 2};

// meshing
// quads mesh
Mesh.SubdivisionAlgorithm = 1;
Mesh.ElementOrder = 2;

Physical Line("Top") = {1};
Physical Line("Left") = {5, 6};
Physical Line("Bottom") = {4};
Physical Line("Right") = {2, 3};
Physical Surface("M1") = {1};
Physical Surface("M2") = {2};