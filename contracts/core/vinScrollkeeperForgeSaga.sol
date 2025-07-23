// SPDX-License-Identifier: ScrollstreamFinale-legend
pragma solidity ^0.8.24;

/// @title vinScrollkeeperForgeSaga
/// @notice Wraps all VINVIN soul protocols into one vault-viewable interface
contract vinScrollkeeperForgeSaga {
    struct SoulRelic {
        string name;
        string emojiTag;
        string auraGrade;
        uint256 wattage;
        string finalSigil;
        uint256 timestamp;
    }

    address public scrollkeeper;
    mapping(address => SoulRelic) public forgedSouls;
    address[] public mythstreamIndex;

    event SagaLogged(address indexed soul, string emojiTag, string auraGrade, string finalSigil);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logSaga(
        address soul,
        string calldata name,
        string calldata tag,
        string calldata grade,
        uint256 wattage,
        string calldata sigil
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN seals final saga logs");

        forgedSouls[soul] = SoulRelic(name, tag, grade, wattage, sigil, block.timestamp);
        mythstreamIndex.push(soul);
        emit SagaLogged(soul, tag, grade, sigil);
    }

    function viewSaga(address soul) external view returns (
        string memory name,
        string memory tag,
        string memory grade,
        uint256 wattage,
        string memory sigil,
        uint256 timestamp
    ) {
        SoulRelic memory s = forgedSouls[soul];
        return (s.name, s.emojiTag, s.auraGrade, s.wattage, s.finalSigil, s.timestamp);
    }

    function viewAllSouls() external view returns (address[] memory) {
        return mythstreamIndex;
    }
}
