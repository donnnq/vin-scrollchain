<template>
  <div class="scroll-container">
    <h1>🧠 Agent Patchstream</h1>
    <div v-for="(update, index) in patchLogs" :key="index" class="patch-card" :class="update.emotionalTag">
      <h2>{{ update.patchName }} 🚀</h2>
      <p><strong>Change:</strong> {{ update.changeSummary }}</p>
      <p><strong>Date Activated:</strong> {{ update.dateActivated }}</p>
      <p><strong>Emotional Tag:</strong> <span class="tag">{{ update.emotionalTag }}</span></p>
      <p class="source">🔗 Agent: {{ update.agentSource }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AgentChangelogVisualizer',
  data() {
    return {
      patchLogs: [
        {
          patchName: 'Patchwave Serenity',
          changeSummary: 'Activated emotional feedback loop for crypto wage reactions.',
          dateActivated: '2025-07-20',
          emotionalTag: 'kilig',
          agentSource: 'ScrollOracle-13'
        },
        {
          patchName: 'Quorum Threshold Rebalance',
          changeSummary: 'Adjusted upvote spread for meme governance.',
          dateActivated: '2025-07-21',
          emotionalTag: 'critical',
          agentSource: 'ScrollSentinel-07'
        }
      ]
    }
  }
}
</script>

<style scoped>
.scroll-container {
  padding: 1.5rem;
  background: #f7f5ff;
  font-family: 'ScrollGrotesque', sans-serif;
}
.patch-card {
  background: white;
  margin-bottom: 1rem;
  padding: 1rem;
  border-left: 5px solid #ccc;
  box-shadow: 0 0 8px rgba(0,0,0,0.08);
}
.patch-card.kilig { border-color: #ff5cb4; }
.patch-card.critical { border-color: #ff4d4d; }

.tag {
  background: #eee;
  padding: 0.25rem 0.5rem;
  border-radius: 6px;
}
.source {
  font-size: 0.85rem;
  color: #555;
}
</style>
