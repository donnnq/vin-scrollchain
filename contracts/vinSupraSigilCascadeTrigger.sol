// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface AlliedSigilNode {
    function isSigilPrimed(string calldata ally) external view returns (bool);
}

contract vinSupraSigilCascadeTrigger {
    address public orchestrator;
    string[] public allies;

    event SupraCascadeInitiated(string[] primedAllies, uint256 timestamp);
    AlliedSigilNode public sigilNode;

    modifier onlyOrchestrator() {
        require(msg.sender == orchestrator, "Not authorized");
        _;
    }

    constructor(address nodeAddress, string[] memory initialAllies) {
        orchestrator = msg.sender;
        sigilNode = AlliedSigilNode(nodeAddress);
        allies = initialAllies;
    }

    function triggerCascade() public onlyOrchestrator {
        string[] memory primed;
        uint256 count;

        for (uint256 i = 0; i < allies.length; i++) {
            if (sigilNode.isSigilPrimed(allies[i])) {
                primed[count] = allies[i];
                count++;
            }
        }

        require(count >= 2, "Insufficient alliance glyph priming");
        emit SupraCascadeInitiated(primed, block.timestamp);
    }
}
