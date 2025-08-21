// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckGlobalAuditLog {
    struct Blessing {
        address steward;
        string workerName;
        string blessingType;
        uint256 amount;
        string currency;
        uint256 timestamp;
    }

    Blessing[] public blessings;

    event BlessingLogged(address steward, string workerName, string blessingType, uint256 amount);

    function logBlessing(
        string memory _workerName,
        string memory _blessingType,
        uint256 _amount,
        string memory _currency
    ) public {
        blessings.push(Blessing({
            steward: msg.sender,
            workerName: _workerName,
            blessingType: _blessingType,
            amount: _amount,
            currency: _currency,
            timestamp: block.timestamp
        }));

        emit BlessingLogged(msg.sender, _workerName, _blessingType, _amount);
    }

    function getBlessings() public view returns (Blessing[] memory) {
        return blessings;
    }
}
