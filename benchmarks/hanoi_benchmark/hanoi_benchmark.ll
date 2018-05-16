target triple="i686"

%struct.plate = type {%struct.plate*, i32}
@peg1 = common global %struct.plate* null, align 8
@peg2 = common global %struct.plate* null, align 8
@peg3 = common global %struct.plate* null, align 8
@numMoves = common global i32 0, align 8

define void @move(i32 %_P_from, i32 %_P_to)
{

L1:
	%from = alloca i32
	store i32 %_P_from, i32* %from
	%to = alloca i32
	store i32 %_P_to, i32* %to
	%plateToMove = alloca %struct.plate*
	%r0 = load i32, i32* %from
	%r1 = icmp eq i32 %r0, 1
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L3, label %L4

L3:
	%r4 = load %struct.plate*, %struct.plate** @peg1
	store %struct.plate* %r4, %struct.plate** %plateToMove
	%r5 = load %struct.plate*, %struct.plate** @peg1
	%r6 = getelementptr %struct.plate , %struct.plate* %r5, i1 0, i32 0
	%r7 = load %struct.plate*, %struct.plate** %r6
	store %struct.plate* %r7, %struct.plate** @peg1
	br label %L5
L4:
	%r8 = load i32, i32* %from
	%r9 = icmp eq i32 %r8, 2
	%r10 = zext i1 %r9 to i32
	%r11 = trunc i32 %r10 to i1
	br i1 %r11, label %L6, label %L7

L5:
	%r20 = load i32, i32* %to
	%r21 = icmp eq i32 %r20, 1
	%r22 = zext i1 %r21 to i32
	%r23 = trunc i32 %r22 to i1
	br i1 %r23, label %L9, label %L10

L6:
	%r12 = load %struct.plate*, %struct.plate** @peg2
	store %struct.plate* %r12, %struct.plate** %plateToMove
	%r13 = load %struct.plate*, %struct.plate** @peg2
	%r14 = getelementptr %struct.plate , %struct.plate* %r13, i1 0, i32 0
	%r15 = load %struct.plate*, %struct.plate** %r14
	store %struct.plate* %r15, %struct.plate** @peg2
	br label %L8
L7:
	%r16 = load %struct.plate*, %struct.plate** @peg3
	store %struct.plate* %r16, %struct.plate** %plateToMove
	%r17 = load %struct.plate*, %struct.plate** @peg3
	%r18 = getelementptr %struct.plate , %struct.plate* %r17, i1 0, i32 0
	%r19 = load %struct.plate*, %struct.plate** %r18
	store %struct.plate* %r19, %struct.plate** @peg3
	br label %L8
L8:
	br label %L5
L9:
	%r24 = load %struct.plate*, %struct.plate** %plateToMove
	%r25 = getelementptr %struct.plate , %struct.plate* %r24, i1 0, i32 0
	%r26 = load %struct.plate*, %struct.plate** @peg1
	store %struct.plate* %r26, %struct.plate** %r25
	%r27 = load %struct.plate*, %struct.plate** %plateToMove
	store %struct.plate* %r27, %struct.plate** @peg1
	br label %L11
L10:
	%r28 = load i32, i32* %to
	%r29 = icmp eq i32 %r28, 2
	%r30 = zext i1 %r29 to i32
	%r31 = trunc i32 %r30 to i1
	br i1 %r31, label %L12, label %L13

L11:
	%r40 = load i32, i32* @numMoves
	%r41 = add i32 %r40, 1
	store i32 %r41, i32* @numMoves
	br label %L2
L12:
	%r32 = load %struct.plate*, %struct.plate** %plateToMove
	%r33 = getelementptr %struct.plate , %struct.plate* %r32, i1 0, i32 0
	%r34 = load %struct.plate*, %struct.plate** @peg2
	store %struct.plate* %r34, %struct.plate** %r33
	%r35 = load %struct.plate*, %struct.plate** %plateToMove
	store %struct.plate* %r35, %struct.plate** @peg2
	br label %L14
L13:
	%r36 = load %struct.plate*, %struct.plate** %plateToMove
	%r37 = getelementptr %struct.plate , %struct.plate* %r36, i1 0, i32 0
	%r38 = load %struct.plate*, %struct.plate** @peg3
	store %struct.plate* %r38, %struct.plate** %r37
	%r39 = load %struct.plate*, %struct.plate** %plateToMove
	store %struct.plate* %r39, %struct.plate** @peg3
	br label %L14
L14:
	br label %L11
L2:
	ret void
}

define void @hanoi(i32 %_P_n, i32 %_P_from, i32 %_P_to, i32 %_P_other)
{

L16:
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%from = alloca i32
	store i32 %_P_from, i32* %from
	%to = alloca i32
	store i32 %_P_to, i32* %to
	%other = alloca i32
	store i32 %_P_other, i32* %other
	%r42 = load i32, i32* %n
	%r43 = icmp eq i32 %r42, 1
	%r44 = zext i1 %r43 to i32
	%r45 = trunc i32 %r44 to i1
	br i1 %r45, label %L18, label %L19

L18:
	%r46 = load i32, i32* %from
	%r47 = load i32, i32* %to
	call void @move(i32 %r46, i32 %r47 )
	br label %L20
L19:
	%r48 = load i32, i32* %n
	%r49 = sub i32 %r48, 1
	%r50 = load i32, i32* %from
	%r51 = load i32, i32* %other
	%r52 = load i32, i32* %to
	call void @hanoi(i32 %r49, i32 %r50, i32 %r51, i32 %r52 )
	%r53 = load i32, i32* %from
	%r54 = load i32, i32* %to
	call void @move(i32 %r53, i32 %r54 )
	%r55 = load i32, i32* %n
	%r56 = sub i32 %r55, 1
	%r57 = load i32, i32* %other
	%r58 = load i32, i32* %to
	%r59 = load i32, i32* %from
	call void @hanoi(i32 %r56, i32 %r57, i32 %r58, i32 %r59 )
	br label %L20
L20:
	br label %L17
L17:
	ret void
}

define void @printPeg(%struct.plate* %_P_peg)
{

L22:
	%peg = alloca %struct.plate*
	store %struct.plate* %_P_peg, %struct.plate** %peg
	%aPlate = alloca %struct.plate*
	%r60 = load %struct.plate*, %struct.plate** %peg
	store %struct.plate* %r60, %struct.plate** %aPlate
	%r67 = load %struct.plate*, %struct.plate** %aPlate
	%r68 = icmp ne %struct.plate* %r67, null
	%r69 = zext i1 %r68 to i32
	%r70 = trunc i32 %r69 to i1
	br i1 %r70, label %L24, label %L25

L24:
	%r61 = load %struct.plate*, %struct.plate** %aPlate
	%r62 = getelementptr %struct.plate , %struct.plate* %r61, i1 0, i32 1
	%r63 = load i32, i32* %r62
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r63)
	%r64 = load %struct.plate*, %struct.plate** %aPlate
	%r65 = getelementptr %struct.plate , %struct.plate* %r64, i1 0, i32 0
	%r66 = load %struct.plate*, %struct.plate** %r65
	store %struct.plate* %r66, %struct.plate** %aPlate
	%r71 = load %struct.plate*, %struct.plate** %aPlate
	%r72 = icmp ne %struct.plate* %r71, null
	%r73 = zext i1 %r72 to i32
	%r74 = trunc i32 %r73 to i1
	br i1 %r74, label %L24, label %L25

L25:
	br label %L23
L23:
	ret void
}

define i32 @main()
{

L27:
	%_retval_ = alloca i32
	%count = alloca i32
	%numPlates = alloca i32
	%aPlate = alloca %struct.plate*
	store %struct.plate* null, %struct.plate** @peg1
	store %struct.plate* null, %struct.plate** @peg2
	store %struct.plate* null, %struct.plate** @peg3
	store i32 0, i32* @numMoves
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %numPlates)
	%r75 = load i32, i32* %numPlates
	%r76 = icmp sge i32 %r75, 1
	%r77 = zext i1 %r76 to i32
	%r78 = trunc i32 %r77 to i1
	br i1 %r78, label %L29, label %L30

L29:
	%r79 = load i32, i32* %numPlates
	store i32 %r79, i32* %count
	%r91 = load i32, i32* %count
	%r92 = icmp ne i32 %r91, 0
	%r93 = zext i1 %r92 to i32
	%r94 = trunc i32 %r93 to i1
	br i1 %r94, label %L32, label %L33

L30:
	br label %L31
L31:
	store i32 0, i32* %_retval_
	br label %L28
L32:
	%r80 = call i8* @malloc(i32 16)
	%r81 = bitcast i8* %r80 to %struct.plate*
	store %struct.plate* %r81, %struct.plate** %aPlate
	%r82 = load %struct.plate*, %struct.plate** %aPlate
	%r83 = getelementptr %struct.plate , %struct.plate* %r82, i1 0, i32 1
	%r84 = load i32, i32* %count
	store i32 %r84, i32* %r83
	%r85 = load %struct.plate*, %struct.plate** %aPlate
	%r86 = getelementptr %struct.plate , %struct.plate* %r85, i1 0, i32 0
	%r87 = load %struct.plate*, %struct.plate** @peg1
	store %struct.plate* %r87, %struct.plate** %r86
	%r88 = load %struct.plate*, %struct.plate** %aPlate
	store %struct.plate* %r88, %struct.plate** @peg1
	%r89 = load i32, i32* %count
	%r90 = sub i32 %r89, 1
	store i32 %r90, i32* %count
	%r95 = load i32, i32* %count
	%r96 = icmp ne i32 %r95, 0
	%r97 = zext i1 %r96 to i32
	%r98 = trunc i32 %r97 to i1
	br i1 %r98, label %L32, label %L33

L33:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	%r99 = load %struct.plate*, %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r99 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	%r100 = load %struct.plate*, %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r100 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	%r101 = load %struct.plate*, %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r101 )
	%r102 = load i32, i32* %numPlates
	call void @hanoi(i32 %r102, i32 1, i32 3, i32 2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	%r103 = load %struct.plate*, %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r103 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	%r104 = load %struct.plate*, %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r104 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	%r105 = load %struct.plate*, %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r105 )
	%r106 = load i32, i32* @numMoves
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r106)
	%r113 = load %struct.plate*, %struct.plate** @peg3
	%r114 = icmp ne %struct.plate* %r113, null
	%r115 = zext i1 %r114 to i32
	%r116 = trunc i32 %r115 to i1
	br i1 %r116, label %L34, label %L35

L34:
	%r107 = load %struct.plate*, %struct.plate** @peg3
	store %struct.plate* %r107, %struct.plate** %aPlate
	%r108 = load %struct.plate*, %struct.plate** @peg3
	%r109 = getelementptr %struct.plate , %struct.plate* %r108, i1 0, i32 0
	%r110 = load %struct.plate*, %struct.plate** %r109
	store %struct.plate* %r110, %struct.plate** @peg3
	%r112 = load %struct.plate*, %struct.plate** %aPlate
	%r111 = bitcast %struct.plate* %r112 to i8*
	call void @free(i8* %r111 )
	%r117 = load %struct.plate*, %struct.plate** @peg3
	%r118 = icmp ne %struct.plate* %r117, null
	%r119 = zext i1 %r118 to i32
	%r120 = trunc i32 %r119 to i1
	br i1 %r120, label %L34, label %L35

L35:
	br label %L31
L28:
	%r121 = load i32, i32* %_retval_
	ret i32 %r121
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8