contract vinAgriStorageGuardian {
    address public steward;

    struct StorageUnit {
        string location;
        bool locked;
        string lastAccessedBy;
    }

    mapping(string => StorageUnit) public units;

    event AccessLogged(string indexed location, string accessedBy);

    constructor() {
        steward = msg.sender;
    }

    function updateAccess(string memory _location, string memory _name) public {
        units[_location].lastAccessedBy = _name;
        emit AccessLogged(_location, _name);
    }

    function toggleLock(string memory _location, bool _locked) public {
        require(msg.sender == steward);
        units[_location].locked = _locked;
    }
}
