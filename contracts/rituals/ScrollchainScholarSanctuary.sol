pragma mythic;

contract ScrollchainScholarSanctuary {
    struct Scholar {
        string name;
        string originCountry;
        string fieldOfStudy;
        string reasonForDisplacement;
        string sanctuaryLocation;
        bool isProtected;
        uint256 timestamp;
    }

    mapping(string => Scholar) public sanctuaryRegistry;

    event ScholarProtected(string name, string sanctuaryLocation);

    function registerScholar(
        string memory _name,
        string memory _origin,
        string memory _field,
        string memory _reason,
        string memory _location
    ) public {
        sanctuaryRegistry[_name] = Scholar(
            _name,
            _origin,
            _field,
            _reason,
            _location,
            true,
            block.timestamp
        );

        emit ScholarProtected(_name, _location);
    }

    function getScholar(string memory _name) public view returns (
        string memory, string memory, string memory, string memory, string memory, bool, uint256
    ) {
        Scholar memory s = sanctuaryRegistry[_name];
        return (
            s.name,
            s.originCountry,
            s.fieldOfStudy,
            s.reasonForDisplacement,
            s.sanctuaryLocation,
            s.isProtected,
            s.timestamp
        );
    }
}
