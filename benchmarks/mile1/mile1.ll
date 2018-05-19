target triple="i686"

%struct.Power = type {i32, i32}

define i32 @calcPower(i32 %base, i32 %exp)
{

L1:
	%r0 = icmp sgt i32 %exp, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	%phi0 = phi i32 [1, %L1], [%r3, %L3]
	%phi1 = phi i32 [%base, %L1], [%phi1, %L3]
	%phi2 = phi i32 [%exp, %L1], [%r4, %L3]
	%r3 = mul i32 %phi0, %phi1
	%r4 = sub i32 %phi2, 1
	%r5 = icmp sgt i32 %r4, 0
	%r6 = zext i1 %r5 to i32
	%r7 = trunc i32 %r6 to i1
	br i1 %r7, label %L3, label %L4

L4:
	%phi3 = phi i32 [1, %L1], [%r3, %L3]
	br label %L2
L2:
	%phi4 = phi i32 [%phi3, %L4]
	ret i32 %phi4
}

define i32 @main()
{

L6:
	%r8 = call i8* @malloc(i32 16)
	%r9 = bitcast i8* %r8 to %struct.Power*
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r10 = load i32, i32* @.read_scratch
	%r11 = getelementptr %struct.Power , %struct.Power* %r9, i1 0, i32 0
	store i32 %r10, i32* %r11
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r12 = load i32, i32* @.read_scratch
	%r13 = icmp slt i32 %r12, 0
	%r14 = zext i1 %r13 to i32
	%r15 = trunc i32 %r14 to i1
	br i1 %r15, label %L8, label %L9

L8:
	%r16 = sub i32 0, 1
	br label %L7
L9:
	br label %L10
L10:
	%r17 = getelementptr %struct.Power , %struct.Power* %r9, i1 0, i32 1
	store i32 %r12, i32* %r17
	%r18 = icmp slt i32 0, 1000000
	%r19 = zext i1 %r18 to i32
	%r20 = trunc i32 %r19 to i1
	br i1 %r20, label %L11, label %L12

L11:
	%phi5 = phi i32 [0, %L10], [%r21, %L11]
	%phi6 = phi %struct.Power* [%r9, %L10], [%phi6, %L11]
	%r21 = add i32 %phi5, 1
	%r22 = getelementptr %struct.Power , %struct.Power* %phi6, i1 0, i32 0
	%r23 = load i32, i32* %r22
	%r24 = getelementptr %struct.Power , %struct.Power* %phi6, i1 0, i32 1
	%r25 = load i32, i32* %r24
	%r26 = call i32 @calcPower(i32 %r23, i32 %r25 )
	%r27 = icmp slt i32 %r21, 1000000
	%r28 = zext i1 %r27 to i32
	%r29 = trunc i32 %r28 to i1
	br i1 %r29, label %L11, label %L12

L12:
	%phi7 = phi i32 [0, %L10], [%r26, %L11]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi7)
	br label %L7
L7:
	%phi8 = phi i32 [%r16, %L8], [1, %L12]
	ret i32 %phi8
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8