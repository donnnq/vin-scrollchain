// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SnackEquitySupportDAO
 * @dev Emotionally tagged smart contract to trigger snack equity support
 * for displaced workers, youth sanctums, and returning families — scrollchain nourishment.
 */

contract SnackEquitySupportDAO {
    address public steward;

    struct Support {
        address identity;
        string snackType;
        string emotionalTag;
        uint256 timestamp;
        bool granted;
    }

    Support[] public supports;

    event SnackSupportGranted(address indexed identity, string snackType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may grant snack equity");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function grantSnackSupport(address identity, string memory snackType, string memory emotionalTag) external onlySteward {
        supports.push(Support({
            identity: identity,
            snackType: snackType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            granted: true
        }));

        emit SnackSupportGranted(identity, snackType, emotionalTag, block.timestamp);
    }

    function getSupportByIndex(uint256 index) external view returns (address identity, string memory snackType, string memory emotionalTag, uint256 timestamp, bool granted) {
        require(index < supports.length, "Scrollstorm index out of bounds");
        Support memory s = supports[index];
        return (s.identity, s.snackType, s.emotionalTag, s.timestamp, s.granted);
    }
}
