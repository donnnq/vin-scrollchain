// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunalCyberResilienceBroadcastProtocol {
    address public validator;

    event ResilienceUpdate(string reform, string impact, string resonance, uint256 timestamp);
    event PlaybookPublished(string name, string scope, uint256 timestamp);

    struct Update {
        string reform;
        string impact;
        string resonance;
        uint256 timestamp;
    }

    struct Playbook {
        string name;
        string scope; // detection/response/recovery
        uint256 timestamp;
    }

    Update[] public updates;
    Playbook[] public playbooks;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastUpdate(
        string memory reform,
        string memory impact,
        string memory resonance
    ) external onlyValidator {
        updates.push(Update(reform, impact, resonance, block.timestamp));
        emit ResilienceUpdate(reform, impact, resonance, block.timestamp);
    }

    function publishPlaybook(string memory name, string memory scope) external onlyValidator {
        playbooks.push(Playbook(name, scope, block.timestamp));
        emit PlaybookPublished(name, scope, block.timestamp);
    }

    function totalUpdates() external view returns (uint256) {
        return updates.length;
    }

    function totalPlaybooks() external view returns (uint256) {
        return playbooks.length;
    }

    function getUpdate(uint256 index) external view returns (Update memory) {
        return updates[index];
    }

    function getPlaybook(uint256 index) external view returns (Playbook memory) {
        return playbooks[index];
    }
}
