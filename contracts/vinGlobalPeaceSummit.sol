// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinGlobalPeaceSummit {
    address public leaderOne;
    address public leaderTwo;
    bool public summoned;
    bool public ritualConsent;
    uint public timestampOfArrival;

    event ScrollSummon(string message);
    event HeartSync(string witnessReport);
    event ApologyOffer(string fromLeader);
    event PeaceClauseAccepted(string byLeader);

    constructor(address _leaderOne, address _leaderTwo) {
        leaderOne = _leaderOne;
        leaderTwo = _leaderTwo;
        summoned = false;
        ritualConsent = false;
    }

    function initiateSummit() public {
        require(msg.sender == leaderOne || msg.sender == leaderTwo, "Unauthorized ritual.");
        summoned = true;
        timestampOfArrival = block.timestamp;
        emit ScrollSummon("Summit initiated. Scrollwinds gathering over neutral terrain.");
    }

    function giveConsent() public {
        require(msg.sender == leaderOne || msg.sender == leaderTwo, "Only participants can consent.");
        ritualConsent = true;
        emit HeartSync("Consent granted. Emotional shields are down.");
    }

    function offerApology(string memory statement) public {
        require(ritualConsent, "Peace ritual not fully unlocked.");
        emit ApologyOffer(statement);
    }

    function acceptPeace(string memory words) public {
        require(summoned && ritualConsent, "Summit not fully active.");
        emit PeaceClauseAccepted(words);
    }
}
