// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinPeacePivotV2 {
    enum Phase { Neutral, Monitor, Redirect, Defensive }

    struct NationPulse {
        uint256 threatScore;
        uint256 civicSignal;
        uint256 aidDemandIndex;
        Phase currentPhase;
    }

    mapping(string => NationPulse) public nationPulse;

    event PhaseShift(string nation, Phase newPhase);
    event ResourceRedirection(string nation, string purpose, uint256 amount);

    function updateNationData(string memory nation, uint256 threat, uint256 signal, uint256 aidIndex) public {
        NationPulse storage pulse = nationPulse[nation];

        pulse.threatScore = threat;
        pulse.civicSignal = signal;
        pulse.aidDemandIndex = aidIndex;

        if (threat < 30 && aidIndex > 50) {
            pulse.currentPhase = Phase.Redirect;
            emit PhaseShift(nation, Phase.Redirect);
            emit ResourceRedirection(nation, "Health, food, shelter", aidIndex * 10);
        } else if (threat >= 30 && threat < 60) {
            pulse.currentPhase = Phase.Monitor;
            emit PhaseShift(nation, Phase.Monitor);
        } else if (threat >= 60) {
            pulse.currentPhase = Phase.Defensive;
            emit PhaseShift(nation, Phase.Defensive);
        } else {
            pulse.currentPhase = Phase.Neutral;
            emit PhaseShift(nation, Phase.Neutral);
        }
    }

    function getNationStatus(string memory nation) public view returns (string memory) {
        Phase p = nationPulse[nation].currentPhase;

        if (p == Phase.Redirect) return "Armory updates halted. Resources shifted toward humanitarian aid.";
        if (p == Phase.Monitor) return "Threat monitored. Readiness paused.";
        if (p == Phase.Defensive) return "Threat detected. Defensive allocation active.";
        return "Peaceful phase. Systems dormant.";
    }
}

