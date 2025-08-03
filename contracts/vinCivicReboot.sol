// SPDX-License-Identifier: Civic-Reboot
pragma solidity ^0.8.19;

contract vinCivicReboot {
    address public dignitary;
    bool public rebootActivated;
    string public restorationMessage;
    uint256 public rebootTimestamp;
    mapping(address => string) public citizenDeclarations;

    event RebootInitiated(string message, uint256 timestamp);
    event DeclarationLogged(address indexed citizen, string message);

    modifier onlyDignitary() {
        require(msg.sender == dignitary, "Not authorized to reboot society");
        _;
    }

    constructor() {
        dignitary = msg.sender;
        rebootActivated = false;
    }

    function initiateReboot(string calldata message) external onlyDignitary {
        require(!rebootActivated, "Reboot already performed");
        restorationMessage = message;
        rebootTimestamp = block.timestamp;
        rebootActivated = true;
        emit RebootInitiated(message, rebootTimestamp);
    }

    function logDeclaration(string calldata message) external {
        require(rebootActivated, "Wait for the reboot");
        citizenDeclarations[msg.sender] = message;
        emit DeclarationLogged(msg.sender, message);
    }

    function checkStatus() external view returns (string memory status) {
        if (rebootActivated) {
            status = "Civic harmony protocols are active. Declaration phase ongoing.";
        } else {
            status = "Pre-reboot phase. Awaiting sovereign invocation.";
        }
    }
}
