#!/usr/bin/env python
# encoding: utf-8
"""
split_ln.py

Created by Neal Caren on 2012-05-14.
neal.caren@unc.edu

Takes a downloaded plain text LexisNexis file and converts it into a CSV file.


sample usage:
$ python split_ln.py T*.txt
Processing The_New_York_Times_TP_2012_1.txt
Processing The_New_York_Times_TP_2012_2.txt
Done

$ python split_ln.py ap_tp_201201.txt
Processing ap_tp_201201.txt
Done

"""



def split_ln(fname):
    print 'Processing\t',fname
    #Imort the two required modules
    import re
    import csv
    outname=fname.replace(fname.split('.')[-1],'csv') #replace the extension with "csv"
    #setup the output file. Maybe give the option for seperate text files, if desired.
    outfile=open(outname,'wb')
    writer = csv.writer(outfile)

    lnraw=open(fname).read() #read the file

       
    workfile=re.sub('                Copyright .*?\\r\\n','ENDOFILE',lnraw) #silly hack to find the end of the documents
    workfile=workfile.replace('\xef\xbb\xbf\r\n','') #clean up crud at the beginning of the file
    workfile=workfile.split('ENDOFILE') #split the file into a list of documents.
    workfile=[f for f in workfile if len(f.split('\r\n\r\n'))>2] #remove an blank rows
    
    #Figure out what special meta data is being reported
    meta_list=list(set(re.findall('\\n([A-Z][A-Z-]*?):',lnraw))) #Find them all
    meta_list=[m for m in meta_list if float(lnraw.count(m))/len(workfile)>.20] #Keep only the commonly occuring ones
    meta_tuple=('SEARCH_ROW','PUBLICATION','DATE','TITLE','EDITION')
    for item in meta_list:
        meta_tuple=meta_tuple+(item,)
    writer.writerow(meta_tuple+('TEXT',))  
        
    #Begin loop over each file
    for f in workfile:
        
        #Split into lines, and clean up the hard returns at the end of each line. Also removes blank lines that the occasional copyright lines  
        filessplit=[row.replace('\r\n',' ') for row in f.split('\r\n\r\n') if len(row)>0 and 'All Rights Reserved' not in row]
        #The id number (from that search) is the first text in the first item of the list
        docid=filessplit[0].lstrip().split(' ')[0]
        dateedition=filessplit[2].lstrip()
        date=dateedition.split(' ')[0]+' '+dateedition.split(' ')[1]+' '+dateedition.split(' ')[2].replace(',','')
        edition= dateedition.replace(date,'').split('                         ')[-1].lstrip()
        if 'GMT' in edition or ('day' in edition):
            edition=''
        title= filessplit[3]
        publication=filessplit[1].lstrip()
        #Extra the text and other information
        text=''
        meta_dict={k : '' for k in meta_list}
        for line in filessplit:
            if len(line)>0 and line[:2]!='  ' and line!=line.upper() and len(re.findall('^[A-Z][A-Z-]*?:',line))==0 and title not in line:
                text=text.lstrip()+' '+line.replace('","','" , "')
            else:
                metacheck=re.findall('^([A-Z][A-Z-]*?):',line)
                if len(metacheck)>0:
                    if metacheck[0] in meta_list:
                       meta_dict[metacheck[0]]=line.replace(metacheck[0]+': ','')  
        
        #Output the results to a csv file
        meta_tuple=(docid,publication,date,title,edition)
        for item in meta_list:
            meta_tuple=meta_tuple+(meta_dict[item],)
        writer.writerow(meta_tuple+(text,))        
        #output.write(docid+'\t'+title+'\t'+text+'\n')   
    print 'Wrote\t\t',outname
    

if __name__ == "__main__":
    import sys
    try: 
        flist=sys.argv[1:]
    except:
        print 'Only one argument please. But you can use things like *.txt'
    else:
        for fname in flist:
            split_ln(fname)
        print 'Done'
    