target triple="i686"



define i32 @isqrt(i32 %a)
{

L1:
	%r0 = icmp sle i32 1, %a
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	%phi0 = phi i32 [1, %L1], [%r3, %L3]
	%phi1 = phi i32 [3, %L1], [%r4, %L3]
	%phi2 = phi i32 [%a, %L1], [%phi2, %L3]
	%r3 = add i32 %phi0, %phi1
	%r4 = add i32 %phi1, 2
	%r5 = icmp sle i32 %r3, %phi2
	%r6 = zext i1 %r5 to i32
	%r7 = trunc i32 %r6 to i1
	br i1 %r7, label %L3, label %L4

L4:
	%phi3 = phi i32 [3, %L1], [%r4, %L3]
	%r8 = sdiv i32 %phi3, 2
	%r9 = sub i32 %r8, 1
	br label %L2
L2:
	%phi4 = phi i32 [%r9, %L4]
	ret i32 %phi4
}

define i32 @prime(i32 %a)
{

L6:
	%r10 = icmp slt i32 %a, 2
	%r11 = zext i1 %r10 to i32
	%r12 = trunc i32 %r11 to i1
	br i1 %r12, label %L8, label %L9

L8:
	%r13 = zext i1 0 to i32
	br label %L7
L9:
	%r14 = call i32 @isqrt(i32 %a )
	%r15 = icmp sle i32 2, %r14
	%r16 = zext i1 %r15 to i32
	%r17 = trunc i32 %r16 to i1
	br i1 %r17, label %L11, label %L12

L11:
	%phi5 = phi i32 [%a, %L9], [%phi5, %L15]
	%phi6 = phi i32 [2, %L9], [%r25, %L15]
	%phi7 = phi i32 [%r14, %L9], [%phi7, %L15]
	%r18 = sdiv i32 %phi5, %phi6
	%r19 = mul i32 %r18, %phi6
	%r20 = sub i32 %phi5, %r19
	%r21 = icmp eq i32 %r20, 0
	%r22 = zext i1 %r21 to i32
	%r23 = trunc i32 %r22 to i1
	br i1 %r23, label %L13, label %L14

L13:
	%r24 = zext i1 0 to i32
	br label %L7
L14:
	br label %L15
L15:
	%r25 = add i32 %phi6, 1
	%r26 = icmp sle i32 %r25, %phi7
	%r27 = zext i1 %r26 to i32
	%r28 = trunc i32 %r27 to i1
	br i1 %r28, label %L11, label %L12

L12:
	%r29 = zext i1 1 to i32
	br label %L7
L7:
	%phi8 = phi i32 [%r13, %L8], [%r24, %L13], [%r29, %L12]
	ret i32 %phi8
}

define i32 @main()
{

L17:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r30 = load i32, i32* @.read_scratch
	%r31 = icmp sle i32 0, %r30
	%r32 = zext i1 %r31 to i32
	%r33 = trunc i32 %r32 to i1
	br i1 %r33, label %L19, label %L20

L19:
	%phi9 = phi i32 [0, %L17], [%r36, %L23]
	%phi12 = phi i32 [%r30, %L17], [%phi11, %L23]
	%r34 = call i32 @prime(i32 %phi9 )
	%r35 = trunc i32 %r34 to i1
	br i1 %r35, label %L21, label %L22

L21:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi9)
	br label %L23
L22:
	br label %L23
L23:
	%phi10 = phi i32 [%phi9, %L21], [%phi9, %L22]
	%phi11 = phi i32 [%phi12, %L21], [%phi12, %L22]
	%r36 = add i32 %phi10, 1
	%r37 = icmp sle i32 %r36, %phi11
	%r38 = zext i1 %r37 to i32
	%r39 = trunc i32 %r38 to i1
	br i1 %r39, label %L19, label %L20

L20:
	br label %L18
L18:
	%phi13 = phi i32 [0, %L20]
	ret i32 %phi13
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8