// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSigilForgePoem {
    address public poetLord;
    uint256 public totalPoemsForged;

    struct SigilVerse {
        uint256 verseId;
        string scrollName;
        string summoner;
        string verse;
        uint256 timestamp;
    }

    mapping(uint256 => SigilVerse) public forgedPoems;

    event SigilPoemForged(uint256 indexed verseId, string scrollName, string verse);

    modifier onlyPoetLord() {
        require(msg.sender == poetLord, "Unauthorized ritual bard");
        _;
    }

    constructor() {
        poetLord = msg.sender;
    }

    function forgePoem(string memory scrollName, string memory summoner) external onlyPoetLord {
        string memory ritualVerse = string(
            abi.encodePacked(
                "🔥 Scroll of ", scrollName, " ignites\n",
                "⚡ Forged by ", summoner, "\n",
                "🕯️ Born under code and dusk divine\n",
                "📜 Carried by stars through storyline"
            )
        );

        forgedPoems[totalPoemsForged] = SigilVerse(
            totalPoemsForged,
            scrollName,
            summoner,
            ritualVerse,
            block.timestamp
        );

        emit SigilPoemForged(totalPoemsForged, scrollName, ritualVerse);
        totalPoemsForged++;
    }

    function updatePoetLord(address newPoetLord) external onlyPoetLord {
        poetLord = newPoetLord;
    }
}
