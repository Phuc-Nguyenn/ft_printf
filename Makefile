# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phunguye <phunguye@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/02 16:17:56 by phunguye          #+#    #+#              #
#    Updated: 2022/05/02 16:17:56 by phunguye         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
SRCS =	ft_printf.c\
		ft_printf_util.c\
		sub_utils.c\
		ft_print_hex.c\

OBJS = $(SRCS:c=o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror -c
RM = rm -rf
HEADER = ft_printf.h
INCLUDES = -I./includes

NAME = libftprintf.a

all:	$(NAME)

$(NAME):
	$(MAKE) -C ./libft
	cp libft/libft.a $(NAME)
	$(CC) $(CFLAGS) $(INCLUDES) $(SRCS)
	ar rcs $(NAME) $(OBJS)

clean:
	$(MAKE) clean -C ./libft
	$(RM) $(OBJS)

fclean:		clean
	$(MAKE) fclean -C ./libft
	$(RM) $(NAME)

re:	fclean all

.PHONY: all clean fclean