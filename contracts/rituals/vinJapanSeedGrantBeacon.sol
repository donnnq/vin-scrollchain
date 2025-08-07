// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Japan Seed Grant Beacon
/// @notice Symbolic $100M grant to uplift Japan's economy with a message of alliance
contract vinJapanSeedGrantBeacon {
    address public creator;
    string public beaconName = "Vinvin's Japan Seed Grant Beacon";
    uint public grantAmount = 100_000_000 * 1e18; // Symbolic $100M in wei
    string public message;

    struct Recipient {
        string prefecture;
        string purpose;
        uint timestamp;
        bool acknowledged;
    }

    mapping(address => Recipient) public recipients;
    address[] public recipientList;

    event GrantIssued(address indexed recipient, string prefecture, string purpose, uint timestamp);
    event MessageUpdated(string newMessage);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can issue grants");
        _;
    }

    constructor() {
        creator = msg.sender;
        message = "Gamitin ninyo ito sa mabuti. Paangatin ang ekonomiya ng maayos at para sa inyo. Ako'y kakampi sa sumusunod, ngunit kalaban sa matigas ang ulo.";
    }

    function issueGrant(address _recipient, string memory _prefecture, string memory _purpose) public onlyCreator {
        recipients[_recipient] = Recipient(_prefecture, _purpose, block.timestamp, false);
        recipientList.push(_recipient);
        emit GrantIssued(_recipient, _prefecture, _purpose, block.timestamp);
    }

    function acknowledgeGrant(address _recipient) public {
        require(msg.sender == _recipient, "Only recipient can acknowledge");
        recipients[_recipient].acknowledged = true;
    }

    function updateMessage(string memory _newMessage) public onlyCreator {
        message = _newMessage;
        emit MessageUpdated(_newMessage);
    }

    function getRecipient(address _recipient) public view returns (Recipient memory) {
        return recipients[_recipient];
    }

    function getAllRecipients() public view returns (address[] memory) {
        return recipientList;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}
