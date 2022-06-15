# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: incho <incho@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/01 08:18:34 by incho             #+#    #+#              #
#    Updated: 2022/06/15 23:41:02 by incho            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.SUFFIXES: .c .o .h

NAME	=	collatz

CP		=	cp
RM		=	rm -f
MKDIR	=	mkdir -p
MV		=	mv
ECHO	=	echo
MAKE	=	make

# ----------------------------------
# Echo Colors
# ----------------------------------

NOCOLOR		= \033[0m
RED			= \033[0;31m
GREEN		= \033[0;32m
ORANGE		= \033[0;33m
BLUE		= \033[0;34m
PURPLE		= \033[0;35m
CYAN		= \033[0;36m
LIGHTGRAY	= \033[0;37m
DARKGRAY	= \033[1;30m
LIGHTRED	= \033[1;31m
LIGHTGREEN	= \033[1;32m
YELLOW		= \033[1;33m
LIGHTBLUE	= \033[1;34m
LIGHTPURPLE	= \033[1;35m
LIGHTCYAN	= \033[1;36m
WHITE		= \033[1;37m

# ----------------------------------
# Mandatory source files
# ----------------------------------

SRCS		=	main.cpp		\
				CollatzTree.cpp
				
# ----------------------------------
# Object files
# ----------------------------------

OBJS		=	$(addprefix $(DIR_OBJ)/, $(SRCS:%.cpp=%.o))

# ----------------------------------
# Directories and Paths
# ----------------------------------

DIR_INC	=	./includes
DIR_SRC	=	./srcs
DIR_OBJ	=	./obj

VPATH	=	$(DIR_SRC) $(addprefix $(DIR_SRC)/, $(SUBDIRS))

# ----------------------------------
# Compiler and flags
# ----------------------------------

CXX			=	c++
CXXFLAGS	=	-Wall -Wextra -Werror

# ----------------------------------
# Debug flag
# ----------------------------------

ifdef DEBUG
	NAME = exe_for_debug
	CXXFLAGS += -g
endif

# ----------------------------------
# Rules
# ----------------------------------

all				:	$(NAME)

$(DIR_OBJ)		:
			@$(MKDIR) $@

$(NAME)			:	$(DIR_OBJ) $(OBJS)
			@$(CXX) $(CXXFLAGS) -I$(DIR_INC) $(OBJS) -o $(NAME)
			@$(ECHO) "Maked $(BLUE)$(NAME)$(NOCOLOR) $(GREEN)Successfully$(NOCOLOR)"

$(DIR_OBJ)/%.o	:	%.cpp
			@$(CXX) $(CXXFLAGS) -I$(DIR_INC) -c $< -o $@
			@$(ECHO) "Compiled $(ORANGE)" $< " $(GREEN)Successfully$(NOCOLOR)"

clean:
			@$(RM) -r $(DIR_OBJ)
			@$(ECHO) "Clean up $(RED)$(NAME)$(NOCOLOR)"

fclean			:	clean
			@$(RM) -r $(NAME)
			@$(RM) -r exe_for_debug
			@$(ECHO) "Removed $(RED)$(NAME)$(NOCOLOR)"

re				:	fclean $(NAME)

# ----------------------------------
# Custom Rules
# ----------------------------------

leak			: 	$(NAME)
			@$(ECHO) "$(YELLOW)Starting memory leak check ...$(NOCOLOR)"
			@valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(NAME)

.PHONY			:	clean fclean re leak
