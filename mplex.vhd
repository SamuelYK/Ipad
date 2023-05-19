--This code generates a 4:1 Multiplexer
library ieee;
use ieee.std_logic_1164.all;
-----------------------------Entity Declaration--------------------------
entity mux is						--s<1,0> are the selectors
port(a,b,c,d,s0,s1:in std_logic; 	--a,b,c,d are the input channels
	q:out std_logic);				--q is the single line where just
									--the selected channel will be shown.

				------- Pin number Assignment --------
attribute pin_numbers of mux:entity is
"a:1 "&  	--Inputs
"b:2 "&
"c:3 "&
"d:4 "&
"s1:5 "&
"s0:6 "&

"q:14 ";	--outputs
end mux;

-------------------------------------------------------------------------
---------------------------Architecture Declaration----------------------
architecture multiplexer of mux is begin

--Concurrent signal assignment statement. (Declaraciones concurrentes asignadas a señales)
--In this kind of declaration, we find boolean expressions, 
--One solution to program a mux 4:1 is using the boolean expression seen in class.
--
q<=(not(s0) and not(s1) and a) or (s0 and not(s1)and b) or 
(not(s0)and s1 and c) or (s0 and s1 and d);


--Another solution is using sequential statements. These statements are >for use in Processes, 
--Procedures and Functions< such as if, case and loop statements. Maxinez pag 69

--process(a,b,c,d,s0,s1)
--begin

--	 if ( s0='0'and s1='0')then q<=a;
--	elsif(s0='1'and s1='0')then q<=b;
--	elsif(s0='0'and s1='1')then q<=c;
--	elsif(s0='1'and s1='1')then q<=d;
--end if;

--end process;

end multiplexer;
