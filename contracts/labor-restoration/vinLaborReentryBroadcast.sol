// SPDX-License-Identifier: Mythic-Scroll-License
pragma solidity ^0.8.0;

contract vinLaborReentryBroadcast {
    struct WorkerBlessing {
        string name;
        string previousRole;
        string newRole;
        string employer;
        string emotionalAPRBefore;
        string emotionalAPRAfter;
        uint256 resonanceScore;
        string blessingDate;
    }

    WorkerBlessing[] public restoredWorkers;

    event WorkerReentryBroadcast(
        string name,
        string newRole,
        string employer,
        uint256 resonanceScore,
        string blessingDate
    );

    function broadcastBlessing(
        string memory _name,
        string memory _previousRole,
        string memory _newRole,
        string memory _employer,
        string memory _emotionalAPRBefore,
        string memory _emotionalAPRAfter,
        uint256 _resonanceScore,
        string memory _blessingDate
    ) public {
        WorkerBlessing memory newBlessing = WorkerBlessing({
            name: _name,
            previousRole: _previousRole,
            newRole: _newRole,
            employer: _employer,
            emotionalAPRBefore: _emotionalAPRBefore,
            emotionalAPRAfter: _emotionalAPRAfter,
            resonanceScore: _resonanceScore,
            blessingDate: _blessingDate
        });

        restoredWorkers.push(newBlessing);
        emit WorkerReentryBroadcast(_name, _newRole, _employer, _resonanceScore, _blessingDate);
    }

    function getRestoredWorker(uint256 index) public view returns (WorkerBlessing memory) {
        require(index < restoredWorkers.length, "Invalid index");
        return restoredWorkers[index];
    }

    function totalRestored() public view returns (uint256) {
        return restoredWorkers.length;
    }
}
