PGDMP         ,                y            tips    12.4    12.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16758    tips    DATABASE     v   CREATE DATABASE tips WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE tips;
                postgres    false            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    3            �            1259    16759    tips    TABLE     �   CREATE TABLE public.tips (
    total_bill numeric,
    tip numeric,
    sex text,
    smoker text,
    day text,
    "time" text,
    size integer
);
    DROP TABLE public.tips;
       public         heap    postgres    false            �          0    16759    tips 
   TABLE DATA           O   COPY public.tips (total_bill, tip, sex, smoker, day, "time", size) FROM stdin;
    public          postgres    false    202   U       �   r  x��Yˮ�D\'����G��l�،Еf$�H�����9��uY���g����R�i����O�m?�����}�������-�)�"z���ǻ���>.�q	m��$O��,�N�7��칆<7	ݽA�z�2����ד+�=�a�t�S��Y|��ǐ�~�������2��y��y����l��݆
C�,t�
�'�B[���P����B�3��|rA��U�����9]С��8<y���@}y�|B}��#D�D��r�/�7ԑ3��$!:��#�Z��jޒ���9�Ʉ�����4�1�f�U�'�g-w��9��#��q�߅�]���4:�M��H� ��ˑV�����:��+gyIP�%]C�kʸ����	�-)�z5& /�Bʮ� [���Pr�,�]��{5\�5dK�����.a(g��>� �X4�CEP@
�'��`E��@E���2-p�Te(<�E�_��^Y{�$�N&!S�T�{C�e �Z�n!�ĴT�@j<��.M�xmR����Z�!��`�6�F�=B�Q]�Z}����<P�~n��G@l�����A�P pV� ��-��x�����5��	��� �Z]y���]/E��߾n?|{��3R(#����G�LD��!��_�ܮ�e3��x~:��;m�J��+W�G�/FcjHݿ���~��za#�gc�5�J�)$�U�Lp��Y��� �9ϏqcY�a��e���D6�S�M/�,'$�g�D��b��t�]I
��.�y�Z[db�+d=��@el�~�s.�%���4m/��$��<�ф�dD����]�Hz S��/p��  1��Җϒ��H�iɚ^�܎iSٴ����V��R7�С3����������6�=w-��GQ��֌ 3�H7��>Q���744�-��l��RFf�D?��@���sm�z2�9�8�X�Gg�|�yN��R���6�f�����'�p.�/����vˮ�� �;\�΄�9��C�#�u.�v��蹷��Λ���
XWOnn�Հ�426~�8L F�DAlb���a:�E�:V8��Æ���u������D��H+�
�B0�bH�͚�): ��P���-\Cb�!�d'��h8����Ѭ������&~[�=z��������f�5��E�5��{����L�5¼��] ��.��o=�>��ԂQO���u��g�v�A2Sb_�0�28^���AD:u`:��L��ɱ�k�e�Q��A*��_n$%a���\�2�/�g,7s�1�3<��Ǝ��U@d�~�IT-��\����������Dl%sJ�+91�ikX�
�vܜ�
���(���(�[+��\k�w�ԓ@]�c�����mE���q�=����>����[D���WA������wE����Q�<M��Ȳ���+�T�x�>�e=�*<��6K�GQ��.� }xE%.� '�Z\+bw9e��d��I��j���C̮�`q�L�'J/=�ˬ��X����KZ�sK����`9a\fb��՟9� V:����-��خ��*���l����?3���
[V�/-�Ǫ�n��f;�bӐM=�@���m[jo����n�w�Nf����5r�H���u�~�\)�S�[���_��χ     