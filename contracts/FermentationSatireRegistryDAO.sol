// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FermentationSatireRegistryDAO {
    address public steward;

    struct SatireEntry {
        string fermentName;
        string satireType; // "Meme", "Mock Recipe", "Spoof Label"
        string originCulture;
        string emotionalTag;
        uint256 timestamp;
    }

    SatireEntry[] public entries;

    event SatireLogged(
        string fermentName,
        string satireType,
        string originCulture,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log fermentation satire rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSatire(
        string memory fermentName,
        string memory satireType,
        string memory originCulture,
        string memory emotionalTag
    ) external onlySteward {
        entries.push(SatireEntry({
            fermentName: fermentName,
            satireType: satireType,
            originCulture: originCulture,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SatireLogged(fermentName, satireType, originCulture, emotionalTag, block.timestamp);
    }

    function getSatireByIndex(uint256 index) external view returns (
        string memory fermentName,
        string memory satireType,
        string memory originCulture,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < entries.length, "Scrollstorm index out of bounds");
        SatireEntry memory s = entries[index];
        return (
            s.fermentName,
            s.satireType,
            s.originCulture,
            s.emotionalTag,
            s.timestamp
        );
    }
}
