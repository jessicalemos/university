#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

#include <math.h>

float cx = 0;
float cy = 0;
float cz = 0;

float ax = 0;
float ay = 0;
float az = 0;

float speed = 5;


void changeSize(int w, int h) {

	// Prevent a divide by zero, when window is too short
	// (you cant make a window with zero width).
	if(h == 0)
		h = 1;

	// compute window's aspect ratio
	float ratio = w * 1.0 / h;

	// Set the projection matrix as current
	glMatrixMode(GL_PROJECTION);
	// Load Identity Matrix
	glLoadIdentity();

	// Set the viewport to be the entire window
    glViewport(0, 0, w, h);

	// Set perspective
	gluPerspective(45.0f ,ratio, 1.0f ,1000.0f);

	// return to the model view matrix mode
	glMatrixMode(GL_MODELVIEW);
}

void draw_cilindro(float radius, int slices, int altura){
    glBegin(GL_TRIANGLES);

    float alfa, nalfa;
    
        for (int j=0; j<slices; j++) {
            
            alfa = j * 2 * M_PI / slices;
            nalfa = (j+1) * 2 * M_PI /slices;

            glVertex3f(0, altura/2, 0);
            glVertex3f(radius * cos(nalfa), altura/2, radius * sin(nalfa));
            glVertex3f(radius * cos(alfa), altura/2, radius * sin(alfa));

            glVertex3f(radius * cos(nalfa), -altura/2, radius * sin(nalfa));
            glVertex3f(0, -altura/2, 0);
            glVertex3f(radius * cos(alfa), -altura/2, radius * sin(alfa));

            glVertex3f(radius * cos(alfa), -altura/2, radius * sin(alfa));
            glVertex3f(radius * cos(alfa), altura/2, radius * sin(alfa));
            glVertex3f(radius * cos(nalfa), -altura/2, radius * sin(nalfa));

            glVertex3f(radius * cos(alfa), altura/2, radius * sin(alfa));
            glVertex3f(radius * cos(nalfa), altura/2, radius * sin(nalfa));
            glVertex3f(radius * cos(nalfa), -altura/2, radius * sin(nalfa));

        }
    
    glEnd();

}



void draw_xyz(float size){
	glColor3f(0,0,0);
	//x
	glBegin(GL_LINES);
    	glVertex3f(0,0,0);
    	glVertex3f(size,0,0);
	glEnd();
	//y
	glBegin(GL_LINES);
		glVertex3f(0,0,0);
		glVertex3f(0,size,0);
	glEnd();
	//z
	glBegin(GL_LINES);
		glVertex3f(0,0,0);
		glVertex3f(0,0,size);
	glEnd();
}


void renderScene(void) {

	// clear buffers
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	// set the camera
	glLoadIdentity();
	gluLookAt(5.0,5.0,5.0,
		      0.0,0.0,0.0,
			  0.0f,1.0f,0.0f);


	draw_xyz(3);
// put the geometric transformations here
	glRotatef(ax,1,0,0);
	glRotatef(ay,0,1,0);
	glRotatef(az,0,0,1);

	glTranslatef(cx,cy,cz);

// put drawing instructions here
	glPolygonMode(GL_FRONT,GL_LINE);
//    glColor3f(0.847, 0.439, 0.133);
    //glPolygonMode(GL_FRONT,GL_LINE);

   draw_cilindro(1,15,3);


	// End of frame
	glutSwapBuffers();
}



// write function to process keyboard events

void translate(unsigned char key,
             int x, int y){
    switch (key) {
        case 'q':
            cx++;
			glutPostRedisplay();
            break;
        case 'w':
            cx--;
			glutPostRedisplay();
            break;
		case 'a':
			cy++;
			glutPostRedisplay();
			break;
		case 's':
			cy--;
			glutPostRedisplay();
			break;
		case 'z':
            cz++;
			glutPostRedisplay();
            break;
        case 'x':
            cz--;
			glutPostRedisplay();
            break;
		case 't':
			ax += speed;
			glutPostRedisplay();
			break;
		case 'y':
			ax -= speed;
			glutPostRedisplay();
			break;
		case 'g':
			ay += speed;
			glutPostRedisplay();
			break;
		case 'h':
	 		ay -= speed;
			glutPostRedisplay();
 			break;
		case 'b':
			az += speed;
			glutPostRedisplay();
			break;
		case 'n':
			az -= speed;
			glutPostRedisplay();
			break;
        case 'l':
            glPolygonMode(GL_FRONT,GL_LINE);
            break;
        case 'f':
            glPolygonMode(GL_FRONT,GL_FILL);
            break;
        default:
            break;
    }
}




int main(int argc, char **argv) {

// init GLUT and the window
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH|GLUT_DOUBLE|GLUT_RGBA);
	glutInitWindowPosition(100,100);
	glutInitWindowSize(800,800);
	glutCreateWindow("CG@DI-UM");

	glClearColor(1,1,1,1) ;
	glClear(GL_COLOR_BUFFER_BIT);

// Required callback registry
	glutDisplayFunc(renderScene);
	glutReshapeFunc(changeSize);
	glutKeyboardFunc(translate);


// put here the registration of the keyboard callbacks



//  OpenGL settings
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_CULL_FACE);

// enter GLUT's main cycle
	glutMainLoop();

	return 1;
}
