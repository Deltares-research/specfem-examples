// levee partially water filled beaver hole
lc=0.2;

Point(1) = {0, 3, 0, lc/2};
Point(2) = {10, 3, 0, lc/2};
Point(3) = {10, 0.5, 0, lc};
Point(4) = {10, 0, 0, lc};
Point(5) = {0, 0, 0, lc};
Point(6) = {0, 0.5, 0, lc};

Point(7) = {5.25, 0, 0, lc/4};
Point(8) = {5.25, 0.5, 0, lc/4};
Point(9) = {5.25, 1, 0, lc/4};
Point(10) = {5.25, 1.75, 0, lc/4};
Point(11) = {5.0, 1.75, 0, lc/4};
Point(12) = {4.75, 1.75, 0,lc/4};
Point(13) = {4.75, 1, 0, lc/4};
Point(14) = {4.75, 0.5, 0, lc/4};
Point(15) = {4.75, 0, 0, lc/4};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 7};
Line(5) = {7, 15};
Line(6) = {15, 5};
Line(7) = {5, 6};
Line(8) = {6, 1};
Line(9) = {3, 8};
Line(10) = {14, 6};
Line(11) = {7, 8};
Line(12) = {8, 9};
Line(13) = {9, 10};
Circle(14) = {10, 11, 12};
Line(15) = {12, 13};
Line(16) = {13, 14};
Line(17) = {14, 15};
Line(18) = {9, 13};

//clay layer
Line Loop(1) = {-1, -8, -10, -16, -15, -14, -13, -12, -9, -2}; Plane Surface(1) = {1};

//sand layer 
Line Loop(2) = {10, -7, -6, -17}; Plane Surface(2) = {2};
Line Loop(3) = {9, -11, -4, -3}; Plane Surface(3) = {3};

//water filled hole
Line Loop(4) = {18, 16, 17, -5, 11, 12}; Plane Surface(4) = {4};

//air filled hole
Line Loop(5) = {14, 15, -18, 13}; Plane Surface(5) = {5};

Recombine Surface{1, 2, 3, 4, 5};

// meshing
// quads mesh
Mesh.SubdivisionAlgorithm = 1;
Mesh.ElementOrder = 2;

Physical Line("Top") = {1};
Physical Line("Left") = {7, 8};
Physical Line("Bottom") = {4,5,6};
Physical Line("Right") = {2, 3};

Physical Surface("M1") = {1}; 		//clay
Physical Surface("M2") = {2, 3}; 	//sand
Physical Surface("M3") = {4}; 		//water
Physical Surface("M4") = {5}; 		//air