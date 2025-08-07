// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinDreamTreatyChronicler
/// @dev Chronicles legendary treaties with emotional signature, poetic aura, and civic depth markers

contract vinDreamTreatyChronicler {
    address public chronicler;

    struct Treaty {
        string name;
        string nationsInvolved;
        string auraDescription;
        uint256 emotionalWeight; // out of 100
        bool blessedByCitizenVote;
        string poeticExcerpt;
        uint256 timestamp;
    }

    Treaty[] public scrollLog;

    event TreatyChronicled(string name, string auraDescription);

    modifier onlyChronicler() {
        require(msg.sender == chronicler, "Only assigned Chronicler");
        _;
    }

    constructor() {
        chronicler = msg.sender;
    }

    function logTreaty(
        string memory name,
        string memory nations,
        string memory aura,
        uint256 weight,
        bool citizenBlessed,
        string memory excerpt
    ) public onlyChronicler {
        scrollLog.push(Treaty(name, nations, aura, weight, citizenBlessed, excerpt, block.timestamp));
        emit TreatyChronicled(name, aura);
    }

    function getAllTreaties() public view returns (Treaty[] memory) {
        return scrollLog;
    }
}
