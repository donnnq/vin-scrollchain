// SPDX-License-Identifier: Mythstream-Gov
pragma solidity ^0.8.26;

contract AgentPollConsensus {
    address public sovereign; // VINVIN scrollkeeper
    uint256 public patchCount;

    struct PatchLog {
        string patchName;
        string changeSummary;
        string dateActivated;
        address agentSource;
    }

    mapping(uint256 => PatchLog) public patchHistory;

    event PatchDrop(string patchName, string changeSummary, string dateActivated, address indexed agentSource);

    modifier onlyAgent() {
        require(msg.sender != address(0), "Invalid sender");
        _;
    }

    constructor(address _sovereign) {
        sovereign = _sovereign;
    }

    function submitPatchLog(
        string memory patchName,
        string memory changeSummary,
        string memory dateActivated
    ) external onlyAgent {
        patchCount++;

        patchHistory[patchCount] = PatchLog({
            patchName: patchName,
            changeSummary: changeSummary,
            dateActivated: dateActivated,
            agentSource: msg.sender
        });

        emit PatchDrop(patchName, changeSummary, dateActivated, msg.sender);
    }

    function getPatchLog(uint256 patchId) external view returns (PatchLog memory) {
        return patchHistory[patchId];
    }
}
