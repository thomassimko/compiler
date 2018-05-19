target triple="i686"

%struct.intList = type {i32, %struct.intList*}
@intList = common global i32 0, align 8

define i32 @length(%struct.intList* %list)
{

L1:
	%r0 = icmp eq %struct.intList* %list, null
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	br label %L2
L4:
	br label %L5
L5:
	%r3 = getelementptr %struct.intList , %struct.intList* %list, i1 0, i32 1
	%r4 = load %struct.intList*, %struct.intList** %r3
	%r5 = call i32 @length(%struct.intList* %r4 )
	%r6 = add i32 1, %r5
	br label %L2
L2:
	%phi0 = phi i32 [0, %L3], [%r6, %L5]
	ret i32 %phi0
}

define %struct.intList* @addToFront(%struct.intList* %list, i32 %element)
{

L7:
	%r7 = icmp eq %struct.intList* %list, null
	%r8 = zext i1 %r7 to i32
	%r9 = trunc i32 %r8 to i1
	br i1 %r9, label %L9, label %L10

L9:
	%r10 = call i8* @malloc(i32 16)
	%r11 = bitcast i8* %r10 to %struct.intList*
	%r12 = getelementptr %struct.intList , %struct.intList* %r11, i1 0, i32 0
	store i32 %element, i32* %r12
	%r13 = getelementptr %struct.intList , %struct.intList* %r11, i1 0, i32 1
	store %struct.intList* null, %struct.intList** %r13
	br label %L8
L10:
	br label %L11
L11:
	%r14 = call i8* @malloc(i32 16)
	%r15 = bitcast i8* %r14 to %struct.intList*
	%r16 = getelementptr %struct.intList , %struct.intList* %r15, i1 0, i32 0
	store i32 %element, i32* %r16
	%r17 = getelementptr %struct.intList , %struct.intList* %r15, i1 0, i32 1
	store %struct.intList* %list, %struct.intList** %r17
	br label %L8
L8:
	%phi1 = phi %struct.intList* [%r11, %L9], [%r15, %L11]
	ret %struct.intList* %phi1
}

define %struct.intList* @deleteFirst(%struct.intList* %list)
{

L13:
	%r18 = icmp eq %struct.intList* %list, null
	%r19 = zext i1 %r18 to i32
	%r20 = trunc i32 %r19 to i1
	br i1 %r20, label %L15, label %L16

L15:
	br label %L14
L16:
	br label %L17
L17:
	%r21 = getelementptr %struct.intList , %struct.intList* %list, i1 0, i32 1
	%r22 = load %struct.intList*, %struct.intList** %r21
	%r23 = bitcast %struct.intList* %list to i8*
	call void @free(i8* %r23 )
	br label %L14
L14:
	%phi2 = phi %struct.intList* [null, %L15], [%r22, %L17]
	ret %struct.intList* %phi2
}

define i32 @main()
{

L19:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r24 = load i32, i32* @.read_scratch
	store i32 %r24, i32* @intList
	%r25 = load i32, i32* @intList
	%r26 = icmp sgt i32 %r25, 0
	%r27 = zext i1 %r26 to i32
	%r28 = trunc i32 %r27 to i1
	br i1 %r28, label %L21, label %L22

L21:
	%phi3 = phi %struct.intList* [null, %L19], [%r30, %L21]
	%phi8 = phi i32 [0, %L19], [%phi8, %L21]
	%r29 = load i32, i32* @intList
	%r30 = call %struct.intList* @addToFront(%struct.intList* %phi3, i32 %r29 )
	%r31 = getelementptr %struct.intList , %struct.intList* %r30, i1 0, i32 0
	%r32 = load i32, i32* %r31
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r32)
	%r33 = load i32, i32* @intList
	%r34 = sub i32 %r33, 1
	store i32 %r34, i32* @intList
	%r35 = load i32, i32* @intList
	%r36 = icmp sgt i32 %r35, 0
	%r37 = zext i1 %r36 to i32
	%r38 = trunc i32 %r37 to i1
	br i1 %r38, label %L21, label %L22

L22:
	%phi4 = phi %struct.intList* [null, %L19], [%r30, %L21]
	%phi7 = phi i32 [0, %L19], [%phi8, %L21]
	%r39 = call i32 @length(%struct.intList* %phi4 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r39)
	%r40 = call i32 @length(%struct.intList* %phi4 )
	%r41 = icmp sgt i32 %r40, 0
	%r42 = zext i1 %r41 to i32
	%r43 = trunc i32 %r42 to i1
	br i1 %r43, label %L23, label %L24

L23:
	%phi5 = phi i32 [%phi7, %L22], [%r46, %L23]
	%phi6 = phi %struct.intList* [%phi4, %L22], [%r48, %L23]
	%r44 = getelementptr %struct.intList , %struct.intList* %phi6, i1 0, i32 0
	%r45 = load i32, i32* %r44
	%r46 = add i32 %phi5, %r45
	%r47 = call i32 @length(%struct.intList* %phi6 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r47)
	%r48 = call %struct.intList* @deleteFirst(%struct.intList* %phi6 )
	%r49 = call i32 @length(%struct.intList* %r48 )
	%r50 = icmp sgt i32 %r49, 0
	%r51 = zext i1 %r50 to i32
	%r52 = trunc i32 %r51 to i1
	br i1 %r52, label %L23, label %L24

L24:
	%phi9 = phi i32 [%phi7, %L22], [%r46, %L23]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi9)
	br label %L20
L20:
	%phi10 = phi i32 [0, %L24]
	ret i32 %phi10
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8