#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
// ref : https://quiet-lilac-e5d.notion.site/chapter3-process-concept-abe56556dfd3421f8aba7b507ee64e70

#define MAX_LEN 100 /* The maximum length command */

int main(void) {
  char *args[MAX_LEN / 2 + 1]; /* command line arguments */
  int should_run = 1;          /* flag to determine when to exit program */
  int background = 0;

  char *input;
  int status;

  while (should_run) {
    printf("my_shell> ");
    fflush(stdout);

    // A. shell 명령어 입력 by fgets.
    char *input = (char*)malloc(MAX_LEN*sizeof(char));
    fgets(input, MAX_LEN, stdin); 

    // B. 입력 받은 문자열 띄어씌기와 줄바꿈 기준으로 분할 - strtok
    // input이 없을 경우엔 goto를 써서 While의 끝부분으로 보낸다.
    // 입력을 받고 바로 input 유무를 판별하지 않는 이유는 fgets는 입력이 없더라도 NULL 값을 반환하지 않기 때문이다.
	int i = 0;
	args[0] = strtok(input," \n");
	while(args[i] != NULL){
		i++;
		args[i] = strtok(NULL, " \n");
	}
        if(args[0] == NULL){
		goto no_input;
	}

    // C. 쪼갠 문자열에서 exit, & 문자열이 있는지 찾는다. by strcmp
    // &을 입력받으면 background에서 해당 프로세스를 실행한다.
   if(strcmp(args[0],"exit")==0){
	break;
	}
   if(strcmp(args[i-1],"&")==0){
	args[i-1] = NULL;
	background = 1;	
	}
// ref : https://quiet-lilac-e5d.notion.site/chapter3-process-concept-abe56556dfd3421f8aba7b507ee64e70

    /**
     * D. fork()를 통해 자식 프로세스를 생성한다.
     * 
     */

    pid_t pid = fork();
    // 에러가 발생한 경우
    if (pid < 0) {
      perror("Fork error");
      exit(0);
    }
    // 자식 프로세스
    else if(pid == 0){
	      sleep(1);
        // 입력 받은 명령어를 실행한다.
        if(execvp(args[0], args)<0){
          printf("command error, not found \n");
        }
      }
    //부모 프로세스
    else{
	    if(!background){
	        printf("waiting for child, not background proccess \n");
          //자식 프로세스가 끝날 때까지 기다린다.
          waitpid(pid, &status,0);
          printf("child process complete \n");	
	      } 
    else{
          printf("background process \n");
          background = 0;
	      }	
	    }
     no_input:;
    }
  return 0;
}