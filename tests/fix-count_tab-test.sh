#!/usr/bin/env bash

MODIFIED=chr19_gene_assigned_cell.tsv
ORIGINAL=$(basename $MODIFIED .tsv)-old.tsv
mv $MODIFIED $ORIGINAL
paste \
    <(paste -d_ \
        <(cat $ORIGINAL | cut -f1 | cut -d_ -f-4) \
        <(cat $ORIGINAL | cut -f1 | cut -d_ -f6) \
        <(cat $ORIGINAL | cut -f1 | cut -d_ -f5) ) \
    <(cat $ORIGINAL | cut -f2) \
    > $MODIFIED