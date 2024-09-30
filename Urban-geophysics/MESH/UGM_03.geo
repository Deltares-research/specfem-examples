// Gmsh project created on Mon Apr 04 16:13:11 2022

// BOX

lc=0.1;

//DEFINE POINTS
//-------------------------------------------
//Boundary points
Point(1) = {0, 0, 0, lc};
Point(2) = {8.8, 0, 0, lc};
Point(3) = {8.8, 1.0, 0, lc/4};
Point(4) = {8.8, 2.0, 0, lc/4};
Point(5) = {8.8, 2.6, 0, lc/2};
Point(6) = {0, 2.6, 0, lc/2};
Point(7) = {0, 1.5, 0, lc/4};
Point(8) = {0, 1.0, 0, lc/4};

//Interal Points
Point(9) = {2, 1.5, 0, lc/4};
Point(10) = {4.4, 1.5, 0, lc/4};
Point(11) = {4.4, 2.0, 0, lc/4};
Point(12) = {6.8, 2.0, 0, lc/4};

//Points along circle of left pipeline
Point(13) = {2, 1.85, 0, lc/8};
Point(14) = {2.1, 1.85, 0, lc/8};
Point(15) = {2, 1.95, 0, lc/8};
Point(16) = {1.9, 1.85, 0, lc/8};
Point(17) = {2, 1.75, 0, lc/8};

//Points along circle of left pipeline
Point(18) = {6.8, 1.85, 0, lc/8};
Point(19) = {6.9, 1.85, 0, lc/8};
Point(20) = {6.8, 1.95, 0, lc/8};
Point(21) = {6.7, 1.85, 0, lc/8};
Point(22) = {6.8, 1.75, 0, lc/8};


//DEFINE LINES
//-------------------------------------------
// Boundary lines
Line(1) = {1, 2};
Line(2) = {2, 3};    
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 1};

// Interfaces
Line(9) = {8, 3};
Line(10) = {7, 9};
Line(11) = {9, 10};
Line(12) = {9, 17};
Line(13) = {9, 10};
Line(14) = {10, 11};
Line(15) = {11, 12};
Line(16) = {12, 20};
Line(17) = {12, 4};

//Circle arcs of left pipeline
Circle(18) = {14, 13, 15};
Circle(19) = {15, 13, 16};
Circle(20) = {16, 13, 17};
Circle(21) = {17, 13, 14};

//Circle arcs of left pipeline
Circle(22) = {19, 18, 20};
Circle(23) = {20, 18, 21};
Circle(24) = {21, 18, 22};
Circle(25) = {22, 18, 19};
 
//DEFINE LOOPS AND SURFACES
//-------------------------------------------
// Loose sand
Line Loop(1) = {4,5,6,10,12,21,18,19,20,-12,13,14,15,17};
Plane Surface(1) = {1};

// Compacted sand
Line Loop(2) = {9,3,-17,16,23,24,25,22,-16,-15,-14,-13,-10,7};
Plane Surface(2) = {2};

// Saturated compacted sand
Line Loop(3) = {1,2,-9,8};
Plane Surface(3) = {3};

//left pipeline
Line Loop (4) = {21,18,19,20};
Plane Surface(4) = {4};

//right pipeline
Line Loop (5) = {23,24,25,22};
Plane Surface(5) = {5};

//RECOMBINE SURFACES
//-------------------------------------------
Recombine Surface{1,2,3,4,5};

// meshing
// quads mesh
//Mesh.SubdivisionAlgorithm = 1;
//Mesh.ElementOrder = 2;

//Mesh.Algorithm = 2; // frontal quad: 8;

// sizing
//Mesh.RecombinationAlgorithm = 2;
//Mesh.CharacteristicLengthFactor = 1.0;

//DEFINE PHYSICAL BOUNDARIES AND SURFACES
//-------------------------------------------
Physical Line("Top") = {5};
Physical Line("Left") = {6,7,8};
Physical Line("Bottom") = {1};
Physical Line("Right") = {2,3,4};

Physical Surface("M1") = {1}; //Loose sand
Physical Surface("M2") = {2}; //Compacted sand
Physical Surface("M3") = {3}; //Saturated compacted sand
Physical Surface("M4") = {4}; //Left pipeline
Physical Surface("M5") = {5}; //Right pipeline


