# cpu scheduling

*cpu scheduling 지표

1.CPU utilization – keep the CPU as busy as possible
2.Throughput – # of processes that complete their execution per time unit 
3.Turnaround time – amount of time to execute a particular process
4.Waiting time – amount of time a process has been waiting in the ready queue
5.Response time – amount of time it takes from when a request was submitted until the first response is produced, not output  (for time-sharing environment)

*cpu 시간 관련 지표

***Arrival Time:** Time at which the process arrives in the ready queue.**Completion Time:** Time at which process completes its execution.**Burst Time:** Time required by a process for CPU execution.**Turn Around Time:** Time Difference between completion time and arrival time.Turn Around Time = Completion Time – Arrival Time*

***Waiting Time(W.T):** Time Difference between turn around time and burst time.Waiting Time = Turn Around Time – Burst Time*

*[RR](https://www.geeksforgeeks.org/program-round-robin-scheduling-set-1/)

키워드 : 시간 공유 기술, 퀀텀(q), 대기 테이블

특징 

- 모든 프로세스가 CPU 공유 가능⇒ no starvation
- 가장 일반적으로 사용되는 기술
- 선전혐 스케쥴링
- 컨텍스트 스위칭으로 인해 자원 효율이 떨어질 수 있다.
- q값이 커지면 사실상 fifo 방식, 지나치게 작으면 스위칭 비용이 커진다.
- q값을 적절하게 조절하는 것이 중요하다.

일반적으로 전체 프로세스의 80% cpu burst time이 q 안에 들어올 때가 가장 좋다고 볼 수 있다.(turn around time)

**[HRRN](https://www.geeksforgeeks.org/highest-response-ratio-next-hrrn-cpu-scheduling/)**

시뮬레이터 참고(https://github.com/alstn2468/cpu-scheduling-simulator/blob/master/CpuSchedulingSimulatorMain.c)