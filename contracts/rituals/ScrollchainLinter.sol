// SPDX-License-Identifier: ScrollchainGuardian
pragma solidity ^0.8.0;

contract ScrollchainLinter {
    struct ScanResult {
        string scrollName;
        bool containsInvalidChars;
        string message;
    }

    ScanResult[] public results;

    event ScrollScanned(string scrollName, bool containsInvalidChars, string message);

    function scanScroll(string memory scrollName, string memory content) public {
        bool hasInvalid = false;
        bytes memory b = bytes(content);

        for (uint i = 0; i < b.length; i++) {
            if (uint8(b[i]) > 127) {
                hasInvalid = true;
                break;
            }
        }

        string memory msgOut = hasInvalid
            ? "⚠️ Invalid characters detected. Use unicode\"...\" for emojis or non-ASCII."
            : "✅ Scroll is clean. Ready for ritual deployment.";

        results.push(ScanResult(scrollName, hasInvalid, msgOut));
        emit ScrollScanned(scrollName, hasInvalid, msgOut);
    }

    function getResult(uint256 index) public view returns (ScanResult memory) {
        return results[index];
    }

    function totalScans() public view returns (uint256) {
        return results.length;
    }
}
