// SPDX-License-Identifier: Mythstream-Index
pragma solidity ^0.8.26;

contract ScrollManifestInterface {
    address public sovereign;
    uint256 public scrollCount;

    struct ScrollMetadata {
        string scrollName;
        string scrollPurpose;
        string patchStatus;
        string timestamp;
        string emotionalTag; // "Kilig", "Critical", "Cooldown", etc.
        address scrollDeployer;
    }

    mapping(uint256 => ScrollMetadata) public scrollLogs;

    event ScrollRegistered(
        string scrollName,
        string scrollPurpose,
        string patchStatus,
        string timestamp,
        string emotionalTag,
        address indexed scrollDeployer
    );

    modifier onlyScrollkeeper() {
        require(msg.sender == sovereign, "Unauthorized lorecaster");
        _;
    }

    constructor(address _sovereign) {
        sovereign = _sovereign;
    }

    function registerScroll(
        string memory scrollName,
        string memory scrollPurpose,
        string memory patchStatus,
        string memory timestamp,
        string memory emotionalTag
    ) external onlyScrollkeeper {
        scrollCount++;

        scrollLogs[scrollCount] = ScrollMetadata({
            scrollName: scrollName,
            scrollPurpose: scrollPurpose,
            patchStatus: patchStatus,
            timestamp: timestamp,
            emotionalTag: emotionalTag,
            scrollDeployer: msg.sender
        });

        emit ScrollRegistered(scrollName, scrollPurpose, patchStatus, timestamp, emotionalTag, msg.sender);
    }

    function viewScrollLog(uint256 id) external view returns (ScrollMetadata memory) {
        return scrollLogs[id];
    }
}
