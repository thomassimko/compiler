target triple="i686"

%struct.IntList = type {i32, %struct.IntList*}

define %struct.IntList* @getIntList()
{

L1:
	%r0 = call i8* @malloc(i32 16)
	%r1 = bitcast i8* %r0 to %struct.IntList*
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r2 = load i32, i32* @.read_scratch
	%r3 = sub i32 0, 1
	%r4 = icmp eq i32 %r2, %r3
	%r5 = zext i1 %r4 to i32
	%r6 = trunc i32 %r5 to i1
	br i1 %r6, label %L3, label %L4

L3:
	%r7 = getelementptr %struct.IntList , %struct.IntList* %r1, i1 0, i32 0
	store i32 %r2, i32* %r7
	%r8 = getelementptr %struct.IntList , %struct.IntList* %r1, i1 0, i32 1
	store %struct.IntList* null, %struct.IntList** %r8
	br label %L2
L4:
	%r9 = getelementptr %struct.IntList , %struct.IntList* %r1, i1 0, i32 0
	store i32 %r2, i32* %r9
	%r10 = call %struct.IntList* @getIntList()
	%r11 = getelementptr %struct.IntList , %struct.IntList* %r1, i1 0, i32 1
	store %struct.IntList* %r10, %struct.IntList** %r11
	br label %L2
L2:
	%phi0 = phi %struct.IntList* [%r1, %L3], [%r1, %L4]
	ret %struct.IntList* %phi0
}

define i32 @biggest(i32 %num1, i32 %num2)
{

L7:
	%r12 = icmp sgt i32 %num1, %num2
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L9, label %L10

L9:
	br label %L8
L10:
	br label %L8
L8:
	%phi1 = phi i32 [%num1, %L9], [%num2, %L10]
	ret i32 %phi1
}

define i32 @biggestInList(%struct.IntList* %list)
{

L13:
	%r15 = getelementptr %struct.IntList , %struct.IntList* %list, i1 0, i32 0
	%r16 = load i32, i32* %r15
	%r17 = getelementptr %struct.IntList , %struct.IntList* %list, i1 0, i32 1
	%r18 = load %struct.IntList*, %struct.IntList** %r17
	%r19 = icmp ne %struct.IntList* %r18, null
	%r20 = zext i1 %r19 to i32
	%r21 = trunc i32 %r20 to i1
	br i1 %r21, label %L15, label %L16

L15:
	%phi2 = phi i32 [%r16, %L13], [%r24, %L15]
	%phi3 = phi %struct.IntList* [%list, %L13], [%r26, %L15]
	%r22 = getelementptr %struct.IntList , %struct.IntList* %phi3, i1 0, i32 0
	%r23 = load i32, i32* %r22
	%r24 = call i32 @biggest(i32 %phi2, i32 %r23 )
	%r25 = getelementptr %struct.IntList , %struct.IntList* %phi3, i1 0, i32 1
	%r26 = load %struct.IntList*, %struct.IntList** %r25
	%r27 = getelementptr %struct.IntList , %struct.IntList* %r26, i1 0, i32 1
	%r28 = load %struct.IntList*, %struct.IntList** %r27
	%r29 = icmp ne %struct.IntList* %r28, null
	%r30 = zext i1 %r29 to i32
	%r31 = trunc i32 %r30 to i1
	br i1 %r31, label %L15, label %L16

L16:
	%phi4 = phi i32 [%r16, %L13], [%r24, %L15]
	br label %L14
L14:
	%phi5 = phi i32 [%phi4, %L16]
	ret i32 %phi5
}

define i32 @main()
{

L18:
	%r32 = call %struct.IntList* @getIntList()
	%r33 = call i32 @biggestInList(%struct.IntList* %r32 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r33)
	br label %L19
L19:
	%phi6 = phi i32 [0, %L18]
	ret i32 %phi6
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8