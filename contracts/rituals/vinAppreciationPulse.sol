// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinAppreciationPulse.sol — A scroll of gratitude forged in delay
/// @dev Rewards citizens for patience, humor, and civic dignity during systemic stasis

contract vinAppreciationPulse {
    address public scrollMaster;
    uint256 public totalTokensForged;
    string public contractLore = "When time faltered, the citizens stood. This scroll remembers.";

    struct Appreciation {
        string title;
        string message;
        uint256 timestamp;
        bool honored;
    }

    mapping(address => Appreciation) public honoredCitizens;
    mapping(address => bool) public hasReceivedToken;

    event PulseForged(address indexed citizen, string title, string message);

    modifier onlyMaster() {
        require(msg.sender == scrollMaster, "Only ScrollMaster may forge tokens");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function honorCitizen(address _citizen, string memory _title, string memory _message) public onlyMaster {
        require(!hasReceivedToken[_citizen], "Citizen already honored");

        honoredCitizens[_citizen] = Appreciation({
            title: _title,
            message: _message,
            timestamp: block.timestamp,
            honored: true
        });

        hasReceivedToken[_citizen] = true;
        totalTokensForged++;

        emit PulseForged(_citizen, _title, _message);
    }

    function getCitizenLore(address _citizen) public view returns (string memory title, string memory message, uint256 timestamp, bool honored) {
        Appreciation memory a = honoredCitizens[_citizen];
        return (a.title, a.message, a.timestamp, a.honored);
    }

    function renameScrollMaster(address _newMaster) public onlyMaster {
        scrollMaster = _newMaster;
    }
}
