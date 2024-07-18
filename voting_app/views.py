from collections import Counter
from django.shortcuts import render
from .models import Vote
from django.shortcuts import render, redirect
from .forms import VoteForm


def vote(request):
    if request.method == 'POST':
        form = VoteForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('success')
    else:
        form = VoteForm()
    return render(request, 'voting_app/vote.html', {'form': form})


def success(request):
    return render(request, 'voting_app/success.html')

import json
def histogram(request):
    # Query the database to get the votes
    votes = Vote.objects.values_list('choice', flat=True)

    # Count the occurrences of each candidate
    candidate_counts = dict(Counter(votes))

    # Format data for D3.js
    plot_data = [{'choice': k, 'votes': v} for k, v in candidate_counts.items()]

    # Render template with data
    return render(request, 'voting_app/histogram.html', {'plot_data': json.dumps(plot_data)})