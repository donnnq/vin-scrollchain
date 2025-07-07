// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollArena {
    enum Outcome { Pending, ChallengerWins, DefenderWins, Draw }

    struct Duel {
        address challenger;
        address defender;
        uint256 scrollChallenger;
        uint256 scrollDefender;
        Outcome result;
        string ritualContext;
        uint256 timestamp;
    }

    Duel[] public duels;
    address public immutable arbiter;

    event ScrollClashed(uint256 indexed duelId, address challenger, address defender, string ritualContext);
    event ScrollTriumphed(uint256 indexed duelId, Outcome result);

    modifier onlyArbiter() {
        require(msg.sender == arbiter, "Not the arbiter");
        _;
    }

    constructor() {
        arbiter = msg.sender;
    }

    function initiateDuel(
        address defender,
        uint256 scrollChallenger,
        uint256 scrollDefender,
        string calldata ritualContext
    ) external {
        duels.push(Duel({
            challenger: msg.sender,
            defender: defender,
            scrollChallenger: scrollChallenger,
            scrollDefender: scrollDefender,
            result: Outcome.Pending,
            ritualContext: ritualContext,
            timestamp: block.timestamp
        }));

        emit ScrollClashed(duels.length - 1, msg.sender, defender, ritualContext);
    }

    function resolveDuel(uint256 duelId, Outcome result) external onlyArbiter {
        require(duelId < duels.length, "Invalid duel");
        require(duels[duelId].result == Outcome.Pending, "Already resolved");

        duels[duelId].result = result;
        emit ScrollTriumphed(duelId, result);
    }

    function getDuel(uint256 duelId) external view returns (Duel memory) {
        require(duelId < duels.length, "Invalid duel");
        return duels[duelId];
    }

    function totalDuels() external view returns (uint256) {
        return duels.length;
    }
}
