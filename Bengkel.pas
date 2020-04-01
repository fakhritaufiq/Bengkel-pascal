program aksesoris_motor;

uses crt;

type barang= record
     nama: string;
     harga: longint;
     jumlah_barang: integer;
end;
type merek= record
     merk: array [1..5] of barang;
     jenisaksesoris: string;
end;

type barangbeli= record
  namaacc: string;
  namamerk: string;
  harga_satuan: longint;
  total_harga: longint;
end;
type listbeli= record
     nama: string;
     total_harga: longint;
     jumlah_pembelian: integer;
     nama_brgbeli: array [1..100] of barangbeli;
end;
type acc= array [1..5] of merek;
type beliacc= array [1..100] of listbeli;
var
        jenis_aksesoris: acc;
        list: beliacc;
        pilih,pilihan,g,s,l,v,p,x: integer;
        belanja:char;

        procedure inputjenisacc(var jenis_aksesoris: acc);
          var
            h,z: integer;
          begin
                  clrscr;
                  writeln('SAAT MENGISI DATA MOHON GUNAKAN HURUF BESAR');
                  writeln('===========================================');
                  z:=1;
                  repeat
                          write('masukan jenis aksesoris ke-',z,': ');
                          readln(jenis_aksesoris[z].jenisaksesoris);
                          z:=z+1;
                  until z>5;
                  clrscr;
                  Z:=1;
                  repeat
                     clrscr;
                     writeln(jenis_aksesoris[z].jenisaksesoris);
                     writeln('===============================');
                     h:=1;
                      repeat
                          write('masukan merk aksesoris ke-',h,': ');
                          readln(jenis_aksesoris[z].merk[h].nama);
                          write('masukan harga aksesoris: ');
                          readln(jenis_aksesoris[z].merk[h].harga);
                          write('masukan jumlah barang: ');
                          readln(jenis_aksesoris[z].merk[h].jumlah_barang);
                          writeln;
                      h:=h+1;
                      until h>5;
                  z:=z+1;
                  until z>5;
          end;

        procedure outputbarang (var jenis_aksesoris: acc);
          var
            i: integer;
          begin
            for i:=1 to 5 do
                begin
                  write(i,'. ',jenis_aksesoris[pilihan].merk[i].nama);
                  writeln(': ',jenis_aksesoris[pilihan].merk[i].harga);
                  writeln('jumlah barang yang tersedia:',
                          jenis_aksesoris[pilihan].merk[i].jumlah_barang);
                end;
          end;

        procedure outputjenisacc (var jenis_aksesoris: acc);
          var
            i: integer;
            begin
                    clrscr;
                    for i:=1 to 5 do
                    begin
                    writeln(i,'. ',jenis_aksesoris[i].jenisaksesoris);
                    end;
            end;

        procedure Belanjakuy (var jenis_aksesoris: acc; var list: beliacc; var p,v: integer);
          var
            b,c: integer;
            jumbrg: integer;
          begin
            c:=p;
            l:=0;
            v:=1;
            s:=1;
            B:=1;
            clrscr;
            writeln('GUNAKAN HURUF BESAR');
            writeln('===================');
            write('masukan nama anda: ');
            readln(list[c].nama);
            c:=c+1;
            X:=X+1;
            repeat
              outputjenisacc(jenis_aksesoris);
              writeln('Pilih Jenis Aksesoris');
              readln(pilihan);
              list[X].nama_brgbeli[b].namaacc:= jenis_aksesoris[pilihan].jenisaksesoris;
              clrscr;
              outputbarang(jenis_aksesoris);
              writeln('pilih jenis merk');
              readln(g);
              writeln('Jumlah barang yang ingin dibeli');
              readln(jumbrg);
              list[X].nama_brgbeli[B].namamerk:= jenis_aksesoris[pilihan].merk[g].nama;
              list[X].nama_brgbeli[B].harga_satuan:= jenis_aksesoris[pilihan].merk[g].harga;
              jenis_aksesoris[pilihan].merk[g].jumlah_barang:= jenis_aksesoris[pilihan].merk[g].jumlah_barang-jumbrg;
              list[X].total_harga:=list[X].total_harga+jenis_aksesoris[pilihan].merk[g].harga*jumbrg;
              list[X].jumlah_pembelian:=list[X].jumlah_pembelian+jumbrg;
              v:=v+1;
              l:=l+1;
              B:=B+1;
              writeln('Masih ingin belanja? Y/T');
              readln(belanja);
              until belanja='T';
              p:=c;
            end;

        procedure Edit (var jenis_aksesoris: acc);
          var
            cariacc, carimerk: string;
            i,z: integer;
          begin
            clrscr;
            writeln('GUNAKAN HURUF BESAR');
            writeln('===================');
            write('Jenis aksesoris yang ingin di edit: ');
            readln(cariacc);
            i:=1;
            while (i<=5) and (jenis_aksesoris[i].jenisaksesoris <> cariacc) do
            begin
              i:=i+1;
            end;
            if (jenis_aksesoris[i].jenisaksesoris=cariacc) then
            begin
              write('Jenis merk yang ingin di edit: ');
              readln(carimerk);
              z:=1;
              while (z<=5) and (jenis_aksesoris[i].merk[z].nama<>carimerk)  do
              begin
                z:=z+1;
              end;
              if (jenis_aksesoris[i].merk[z].nama=carimerk) then
              begin
                writeln('Harga sebelumnya: ', jenis_aksesoris[i].merk[z].harga);
                write('Masukan Harga baru: ');
                readln(jenis_aksesoris[i].merk[z].harga);
              end
              else
              begin
                writeln('Barang tidak ditemukan');
              end;
            end
            else
              writeln('Barang tidak ditemukan');
            readln;
          end;

        procedure delete(var jenis_aksesoris: acc);
          var
            cariacc, carimerk: string;
            i,z: integer;
          begin
            clrscr;
            writeln('GUNAKAN HURUF BESAR');
            writeln('===================');
            write('Jenis aksesoris: ');
            readln(cariacc);
            i:=1;
            while (i<=5) and (jenis_aksesoris[i].jenisaksesoris <> cariacc) do
            begin
              i:=i+1;
            end;
            if (jenis_aksesoris[i].jenisaksesoris=cariacc) then
            begin
              write('Jenis merk yang ingin di hapus: ');
              readln(carimerk);
              z:=1;
              while (z<=5) and (jenis_aksesoris[i].merk[z].nama<>carimerk)  do
              begin
                z:=z+1;
              end;
              if (jenis_aksesoris[i].merk[z].nama=carimerk) then
              begin
                repeat
                  jenis_aksesoris[i].merk[Z].nama:=jenis_aksesoris[i].merk[Z+1].nama;
                  jenis_aksesoris[i].merk[Z].harga:=jenis_aksesoris[i].merk[Z+1].harga;
                  jenis_aksesoris[i].merk[Z].jumlah_barang:=jenis_aksesoris[i].merk[Z+1].jumlah_barang;
                  Z:=Z+1;
                until (Z>5);
                Z:=5;
                jenis_aksesoris[i].merk[z].nama:='';
                jenis_aksesoris[i].merk[z].harga:=0;
                jenis_aksesoris[i].merk[z].jumlah_barang:=0;
              end
              else
                writeln('Barang tidak ditemukan');
            end
            else
              writeln('Barang tidak ditemukan');
            readln;
          end;

        procedure search(var jenis_aksesoris: acc);
          var
            cariacc, carimerk: string;
            i,z: integer;
          begin
            clrscr;
            writeln('GUNAKAN HURUF BESAR');
            writeln('===================');
            write('Jenis aksesoris yang di cari: ');
            readln(cariacc);
            write('Jenis merk yang di cari: ');
            readln(carimerk);
            i:=1;
            z:=1;
            while (i<=5) and (jenis_aksesoris[i].jenisaksesoris <> cariacc) do
            begin
              i:=i+1;
            end;
            if (jenis_aksesoris[i].jenisaksesoris=cariacc) then
              begin
               while (z<=5) and (jenis_aksesoris[i].merk[z].nama<>carimerk)  do
               begin
                 z:=z+1;
               end;
               if (jenis_aksesoris[i].merk[z].nama=carimerk) then
                 begin
                   write('harga aksesoris: ');
                   writeln(jenis_aksesoris[i].merk[z].harga);
                 end
                else
                  writeln('Barang tidak ditemukan');
              end
            else
               writeln('Barang tidak ditemukan');
            readln;
          end;

        procedure sorting (jenis_aksesoris: acc);
          var
            i,t,h,min,pass: integer;
            temp: array [1..5] of barang;
          begin
            clrscr;
            for i:=1 to 5 do
            begin
            writeln(i,'. ',jenis_aksesoris[i].jenisaksesoris);
            end;
            writeln('Pilih jenis aksesoris');
            readln(t);
            for pass:=1 to 4 do
              begin
                min:=pass;
                for h:=min+1 to 5 do
                  begin
                    if jenis_aksesoris[t].merk[h].harga > jenis_aksesoris[t].merk[min].harga then
                      begin
                      min:= h;
                      end;
                   temp[1]:= jenis_aksesoris[t].merk[h];
                   jenis_aksesoris[t].merk[h]:=jenis_aksesoris[t].merk[min];
                   jenis_aksesoris[t].merk[min]:= temp[1];
                  end;
              end;
            for s:=1 to 5 do
              begin
                write(s,'. ',jenis_aksesoris[t].merk[s].nama);
                writeln(': ',jenis_aksesoris[t].merk[s].harga);
              end;
          end;

        procedure pembelian(list: beliacc; p,v: integer);
          var
            i,c: integer;
            begin
              clrscr;
              i:=1;
              for c:=1 to P-1 do
                begin
                  writeln('Nama anda: ',C,'. ',list[c].nama);
                end;
              write('Pilih nama anda: ');
              readln(c);
              for i:=1 to v-1 do
                begin
                  writeln('Jenis acc yang di beli: ',list[c].nama_brgbeli[i].namaacc);
                  writeln('Merk yang di beli: ',list[c].nama_brgbeli[i].namamerk);
                  writeln('Harga satuan: ',list[c].nama_brgbeli[i].harga_satuan);
                end;
                writeln('Jumlah pembelian: ',list[X].jumlah_pembelian);
                writeln('Total harga: ', list[C].total_harga);
            end;

//Program Utama

begin
        clrscr;
        P:=1;
        x:=0;
        repeat
        clrscr;
        writeln('Program Aksesoris Motor');
        writeln('=======================');
        writeln('    1. Input Data      ');
        writeln('    2. Belanja         ');
        writeln('    3. Edit Data       ');
        writeln('    4. Delete Data     ');
        writeln('    5. Cari Barang     ');
        writeln('    6. Sorting Harga   ');
        writeln('    7. Barang Belanja  ');
        writeln('    8. EXIT            ');
        writeln('===Pilih Menu Diatas===');
        readln(pilih);
        case pilih of
             1: begin
                  inputjenisacc(jenis_aksesoris);
                end;
             2: begin
                  Belanjakuy(jenis_aksesoris,list,p,v);
                end;
             3: begin
                  Edit(jenis_aksesoris);
                 readln;
                end;
             4: begin
                  delete(jenis_aksesoris);
                end;
             5: begin
                  search(jenis_aksesoris);
                end;
             6: begin
                  sorting(jenis_aksesoris);
                 readln;
                end;
             7: begin
                  pembelian(list,p,v);
                  readln;
                end;
        end;
        until Pilih=8;
   readln;
end.
