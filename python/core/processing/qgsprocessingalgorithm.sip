/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/processing/qgsprocessingalgorithm.h                         *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/






%ModuleHeaderCode
#include <qgsprocessingmodelalgorithm.h>
%End


class QgsProcessingAlgorithm
{
%Docstring
 Abstract base class for processing algorithms.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgsprocessingalgorithm.h"
%End

%ConvertToSubClassCode
    if ( dynamic_cast< QgsProcessingModelAlgorithm * >( sipCpp ) != NULL )
      sipType = sipType_QgsProcessingModelAlgorithm;
    else if ( dynamic_cast< QgsProcessingFeatureBasedAlgorithm * >( sipCpp ) != NULL )
      sipType = sipType_QgsProcessingFeatureBasedAlgorithm;
    else
      sipType = sipType_QgsProcessingAlgorithm;
%End
  public:

    enum Flag
    {
      FlagHideFromToolbox,
      FlagHideFromModeler,
      FlagSupportsBatch,
      FlagCanCancel,
      FlagRequiresMatchingCrs,
      FlagDeprecated,
    };
    typedef QFlags<QgsProcessingAlgorithm::Flag> Flags;


    QgsProcessingAlgorithm();
%Docstring
 Constructor for QgsProcessingAlgorithm.

 initAlgorithm() should be called after creating an algorithm to ensure it can correctly configure
 its parameterDefinitions() and outputDefinitions(). Alternatively, calling create() will return
 a pre-initialized copy of the algorithm.
%End

    virtual ~QgsProcessingAlgorithm();



    QgsProcessingAlgorithm *create( const QVariantMap &configuration = QVariantMap() ) const /TransferBack/;
%Docstring
 Creates a copy of the algorithm, ready for execution.

 This method returns a new, preinitialized copy of the algorithm, ready for
 executing.

 The ``configuration`` argument allows passing of a map of configuration settings
 to the algorithm, allowing it to dynamically adjust its initialized parameters
 and outputs according to this configuration. This is generally used only for
 algorithms in a model, allowing them to adjust their behavior at run time
 according to some user configuration.

.. seealso:: initAlgorithm()
 :rtype: QgsProcessingAlgorithm
%End

    virtual QString name() const = 0;
%Docstring
 Returns the algorithm name, used for identifying the algorithm. This string
 should be fixed for the algorithm, and must not be localised. The name should
 be unique within each provider. Names should contain lowercase alphanumeric characters
 only and no spaces or other formatting characters.
.. seealso:: displayName()
.. seealso:: group()
.. seealso:: tags()
 :rtype: str
%End

    QString id() const;
%Docstring
 Returns the unique ID for the algorithm, which is a combination of the algorithm
 provider's ID and the algorithms unique name (e.g. "qgis:mergelayers" ).
.. seealso:: name()
.. seealso:: provider()
 :rtype: str
%End

    virtual QString displayName() const = 0;
%Docstring
 Returns the translated algorithm name, which should be used for any user-visible display
 of the algorithm name.
.. seealso:: name()
 :rtype: str
%End

    virtual QStringList tags() const;
%Docstring
 Returns a list of tags which relate to the algorithm, and are used to assist users in searching
 for suitable algorithms. These tags should be localised.
 :rtype: list of str
%End

    virtual QString shortHelpString() const;
%Docstring
 Returns a localised short helper string for the algorithm. This string should provide a basic description
 about what the algorithm does and the parameters and outputs associated with it.
.. seealso:: helpString()
.. seealso:: helpUrl()
 :rtype: str
%End

    virtual QString helpString() const;
%Docstring
 Returns a localised help string for the algorithm. Algorithm subclasses should implement either
 helpString() or helpUrl().
.. seealso:: helpUrl()
.. seealso:: shortHelpString()
 :rtype: str
%End

    virtual QString helpUrl() const;
%Docstring
 Returns a url pointing to the algorithm's help page.
.. seealso:: helpString()
.. seealso:: shortHelpString()
 :rtype: str
%End

    virtual QIcon icon() const;
%Docstring
 Returns an icon for the algorithm.
.. seealso:: svgIconPath()
 :rtype: QIcon
%End

    virtual QString svgIconPath() const;
%Docstring
 Returns a path to an SVG version of the algorithm's icon.
.. seealso:: icon()
 :rtype: str
%End

    virtual QString group() const;
%Docstring
 Returns the name of the group this algorithm belongs to. This string
 should be localised.
.. seealso:: tags()
 :rtype: str
%End

    virtual Flags flags() const;
%Docstring
 Returns the flags indicating how and when the algorithm operates and should be exposed to users.
 Default flags are FlagSupportsBatch and FlagCanCancel.
 :rtype: Flags
%End

    virtual bool canExecute( QString *errorMessage /Out/ = 0 ) const;
%Docstring
 Returns true if the algorithm can execute. Algorithm subclasses can return false
 here to indicate that they are not able to execute, e.g. as a result of unmet
 external dependencies. If specified, the ``errorMessage`` argument will be filled
 with a localised error message describing why the algorithm cannot execute.
 :rtype: bool
%End

    virtual bool checkParameterValues( const QVariantMap &parameters,
                                       QgsProcessingContext &context, QString *message /Out/ = 0 ) const;
%Docstring
 Checks the supplied ``parameter`` values to verify that they satisfy the requirements
 of this algorithm in the supplied ``context``. The ``message`` parameter will be
 filled with explanatory text if validation fails.
 Overridden implementations should also check this base class implementation.
 :return: true if parameters are acceptable for the algorithm.
 :rtype: bool
%End

    QgsProcessingProvider *provider() const;
%Docstring
 Returns the provider to which this algorithm belongs.
 :rtype: QgsProcessingProvider
%End

    QgsProcessingParameterDefinitions parameterDefinitions() const;
%Docstring
 Returns an ordered list of parameter definitions utilized by the algorithm.
.. seealso:: addParameter()
.. seealso:: parameterDefinition()
.. seealso:: destinationParameterDefinitions()
 :rtype: QgsProcessingParameterDefinitions
%End

    const QgsProcessingParameterDefinition *parameterDefinition( const QString &name ) const;
%Docstring
 Returns a matching parameter by ``name``. Matching is done in a case-insensitive
 manner.
.. seealso:: parameterDefinitions()
 :rtype: QgsProcessingParameterDefinition
%End

    int countVisibleParameters() const;
%Docstring
 Returns the number of visible (non-hidden) parameters defined by this
 algorithm.
 :rtype: int
%End

    QgsProcessingParameterDefinitions destinationParameterDefinitions() const;
%Docstring
 Returns a list of destination parameters definitions utilized by the algorithm.
.. seealso:: QgsProcessingParameterDefinition.isDestination()
.. seealso:: parameterDefinitions()
 :rtype: QgsProcessingParameterDefinitions
%End

    QgsProcessingOutputDefinitions outputDefinitions() const;
%Docstring
 Returns an ordered list of output definitions utilized by the algorithm.
.. seealso:: addOutput()
.. seealso:: outputDefinition()
 :rtype: QgsProcessingOutputDefinitions
%End

    const QgsProcessingOutputDefinition *outputDefinition( const QString &name ) const;
%Docstring
 Returns a matching output by ``name``. Matching is done in a case-insensitive
 manner.
.. seealso:: outputDefinitions()
 :rtype: QgsProcessingOutputDefinition
%End

    bool hasHtmlOutputs() const;
%Docstring
 Returns true if this algorithm generates HTML outputs.
 :rtype: bool
%End

    QVariantMap run( const QVariantMap &parameters,
                     QgsProcessingContext &context, QgsProcessingFeedback *feedback, bool *ok /Out/ = 0 ) const;
%Docstring
 Executes the algorithm using the specified ``parameters``. This method internally
 creates a copy of the algorithm before running it, so it is safe to call
 on algorithms directly retrieved from QgsProcessingRegistry and QgsProcessingProvider.

 The ``context`` argument specifies the context in which the algorithm is being run.

 Algorithm progress should be reported using the supplied ``feedback`` object.

 If specified, ``ok`` will be set to true if algorithm was successfully run.

 :return: A map of algorithm outputs. These may be output layer references, or calculated
 values such as statistical calculations.

.. note::

   this method can only be called from the main thread. Use prepare(), runPrepared() and postProcess()
 if you need to run algorithms from a background thread, or use the QgsProcessingAlgRunnerTask class.
 :rtype: QVariantMap
%End

    bool prepare( const QVariantMap &parameters, QgsProcessingContext &context, QgsProcessingFeedback *feedback );
%Docstring
 Prepares the algorithm for execution. This must be run in the main thread, and allows the algorithm
 to pre-evaluate input parameters in a thread-safe manner. This must be called before
 calling runPrepared() (which is safe to do in any thread).
.. seealso:: runPrepared()
.. seealso:: postProcess()
.. note::

   This method modifies the algorithm instance, so it is not safe to call
 on algorithms directly retrieved from QgsProcessingRegistry and QgsProcessingProvider. Instead, a copy
 of the algorithm should be created with clone() and prepare()/runPrepared() called on the copy.
 :rtype: bool
%End

    QVariantMap runPrepared( const QVariantMap &parameters, QgsProcessingContext &context, QgsProcessingFeedback *feedback );
%Docstring
 Runs the algorithm, which has been prepared by an earlier call to prepare().
 This method is safe to call from any thread. Returns true if the algorithm was successfully executed.
 After runPrepared() has finished, the postProcess() method should be called from the main thread
 to allow the algorithm to perform any required cleanup tasks and return its final result.
.. seealso:: prepare()
.. seealso:: postProcess()
.. note::

   This method modifies the algorithm instance, so it is not safe to call
 on algorithms directly retrieved from QgsProcessingRegistry and QgsProcessingProvider. Instead, a copy
 of the algorithm should be created with clone() and prepare()/runPrepared() called on the copy.
 :rtype: QVariantMap
%End

    QVariantMap postProcess( QgsProcessingContext &context, QgsProcessingFeedback *feedback );
%Docstring
 Should be called in the main thread following the completion of runPrepared(). This method
 allows the algorithm to perform any required cleanup tasks. The returned variant map
 includes the results evaluated by the algorithm.
.. note::

   This method modifies the algorithm instance, so it is not safe to call
 on algorithms directly retrieved from QgsProcessingRegistry and QgsProcessingProvider. Instead, a copy
 of the algorithm should be created with clone() and prepare()/runPrepared() called on the copy.
 :rtype: QVariantMap
%End

    virtual QWidget *createCustomParametersWidget( QWidget *parent = 0 ) const /Factory/;
%Docstring
 If an algorithm subclass implements a custom parameters widget, a copy of this widget
 should be constructed and returned by this method.
 The base class implementation returns None, which indicates that an autogenerated
 parameters widget should be used.
 :rtype: QWidget
%End

    QgsExpressionContext createExpressionContext( const QVariantMap &parameters,
        QgsProcessingContext &context ) const;
%Docstring
 Creates an expression context relating to the algorithm. This can be called by algorithms
 to create a new expression context ready for evaluating expressions within the algorithm.
 :rtype: QgsExpressionContext
%End

    virtual bool validateInputCrs( const QVariantMap &parameters,
                                   QgsProcessingContext &context ) const;
%Docstring
 Checks whether the coordinate reference systems for the specified set of ``parameters``
 are valid for the algorithm. For instance, the base implementation performs
 checks to ensure that all input CRS are equal
 Returns true if ``parameters`` have passed the CRS check.
 :rtype: bool
%End

    virtual QString asPythonCommand( const QVariantMap &parameters, QgsProcessingContext &context ) const;
%Docstring
 Returns a Python command string which can be executed to run the algorithm
 using the specified ``parameters``.

 Algorithms which cannot be run from a Python command should return an empty
 string.
 :rtype: str
%End

    void setProvider( QgsProcessingProvider *provider );
%Docstring
 Associates this algorithm with its provider. No transfer of ownership is involved.
%End

  protected:

    virtual QgsProcessingAlgorithm *createInstance() const = 0 /Factory/;
%Docstring
 Creates a new instance of the algorithm class.

 This method should return a 'pristine' instance of the algorithm class.
 :rtype: QgsProcessingAlgorithm
%End

    virtual void initAlgorithm( const QVariantMap &configuration = QVariantMap() ) = 0;
%Docstring
 Initializes the algorithm using the specified ``configuration``.

 This should be called directly after creating algorithms and before retrieving
 any parameterDefinitions() or outputDefinitions().

 Subclasses should use their implementations to add all required input parameter and output
 definitions (which can be dynamically adjusted according to ``configuration``).

 Dynamic configuration can be used by algorithms which alter their behavior
 when used inside processing models. For instance, a "feature router" type
 algorithm which sends input features to one of any number of outputs sinks
 based on some preconfigured filter parameters can use the init method to
 create these outputs based on the specified ``configuration``.

.. seealso:: addParameter()
.. seealso:: addOutput()
%End

    bool addParameter( QgsProcessingParameterDefinition *parameterDefinition /Transfer/, bool createOutput = true );
%Docstring
 Adds a parameter ``definition`` to the algorithm. Ownership of the definition is transferred to the algorithm.
 Returns true if parameter could be successfully added, or false if the parameter could not be added (e.g.
 as a result of a duplicate name).

 This should usually be called from a subclass' initAlgorithm() implementation.

 If the ``createOutput`` argument is true, then a corresponding output definition will also be created
 (and added to the algorithm) where appropriate. E.g. when adding a QgsProcessingParameterVectorDestination
 and ``createOutput`` is true, then a QgsProcessingOutputVectorLayer output will be created and
 added to the algorithm. There is no need to call addOutput() to manually add a corresponding output
 for this vector. If ``createOutput`` is false then this automatic output creation will not
 occur.

.. seealso:: initAlgorithm()
.. seealso:: addOutput()
 :rtype: bool
%End

    void removeParameter( const QString &name );
%Docstring
 Removes the parameter with matching ``name`` from the algorithm, and deletes any existing
 definition.
%End

    bool addOutput( QgsProcessingOutputDefinition *outputDefinition /Transfer/ );
%Docstring
 Adds an output ``definition`` to the algorithm. Ownership of the definition is transferred to the algorithm.
 Returns true if the output could be successfully added, or false if the output could not be added (e.g.
 as a result of a duplicate name).

 This should usually be called from a subclass' initAlgorithm() implementation.

 Note that in some cases output creation can be automatically performed when calling addParameter().
 See the notes in addParameter() for a description of when this occurs.

.. seealso:: addParameter()
.. seealso:: initAlgorithm()
 :rtype: bool
%End

    virtual bool prepareAlgorithm( const QVariantMap &parameters, QgsProcessingContext &context, QgsProcessingFeedback *feedback ) /VirtualErrorHandler=processing_exception_handler/;
%Docstring
 Prepares the algorithm to run using the specified ``parameters``. Algorithms should implement
 their logic for evaluating parameter values here. The evaluated parameter results should
 be stored in member variables ready for a call to processAlgorithm().

 The ``context`` argument specifies the context in which the algorithm is being run.

 prepareAlgorithm should be used to handle any thread-sensitive preparation which is required
 by the algorithm. It will always be called from the same thread that ``context`` has thread
 affinity with. While this will generally be the main thread, it is not guaranteed. For instance,
 algorithms which are run as a step in a larger model or as a subcomponent of a script-based algorithm
 will call prepareAlgorithm from the same thread as that model/script it being executed in.

 Note that the processAlgorithm step uses a temporary context with affinity for the thread in
 which the algorithm is executed, making it safe for processAlgorithm implementations to load
 sources and sinks without issue. Implementing prepareAlgorithm is only required if special
 thread safe handling is required by the algorithm.

 Algorithm preparation progress should be reported using the supplied ``feedback`` object. Additionally,
 well-behaved algorithms should periodically check ``feedback`` to determine whether the
 algorithm should be canceled and exited early.

 If the preparation was successful algorithms must return true. If a false value is returned
 this indicates that the preparation could not be completed, and the algorithm execution
 will be canceled.

 :return: true if preparation was successful.
.. seealso:: processAlgorithm()
.. seealso:: postProcessAlgorithm()
 :rtype: bool
%End

    virtual QVariantMap processAlgorithm( const QVariantMap &parameters, QgsProcessingContext &context, QgsProcessingFeedback *feedback ) = 0 /VirtualErrorHandler=processing_exception_handler/;
%Docstring
 Runs the algorithm using the specified ``parameters``. Algorithms should implement
 their custom processing logic here.

 The ``context`` argument gives a temporary context with thread affinity matching the thread
 in which the algorithm is being run. This is a cut-back copy of the context passed to
 the prepareAlgorithm() and postProcessAlgorithm() steps, but it is generally safe
 for most algorithms to utilize this context for loading layers and creating sinks.
 Any loaded layers or sinks created within this temporary context will be transferred
 back to the main execution context upon successful completion of the processAlgorithm()
 step.

 Algorithm progress should be reported using the supplied ``feedback`` object. Additionally,
 well-behaved algorithms should periodically check ``feedback`` to determine whether the
 algorithm should be canceled and exited early.

 This method will not be called if the prepareAlgorithm() step failed (returned false).

 c++ implementations of processAlgorithm can throw the QgsProcessingException exception
 to indicate that a fatal error occurred within the execution. Python based subclasses
 should raise GeoAlgorithmExecutionException for the same purpose.

 :return: A map of algorithm outputs. These may be output layer references, or calculated
 values such as statistical calculations. Unless the algorithm subclass overrides
 the postProcessAlgorithm() step this returned map will be used as the output for the
 algorithm.

.. seealso:: prepareAlgorithm()
.. seealso:: postProcessAlgorithm()
 :rtype: QVariantMap
%End

    virtual QVariantMap postProcessAlgorithm( QgsProcessingContext &context, QgsProcessingFeedback *feedback ) /VirtualErrorHandler=processing_exception_handler/;
%Docstring
 Allows the algorithm to perform any required cleanup tasks. The returned variant map
 includes the results evaluated by the algorithm. These may be output layer references, or calculated
 values such as statistical calculations.

 The ``context`` argument specifies the context in which the algorithm was run.

 Postprocess progress should be reported using the supplied ``feedback`` object. Additionally,
 well-behaved algorithms should periodically check ``feedback`` to determine whether the
 post processing should be canceled and exited early.

 postProcessAlgorithm should be used to handle any thread-sensitive cleanup which is required
 by the algorithm. It will always be called from the same thread that ``context`` has thread
 affinity with. While this will generally be the main thread, it is not guaranteed. For instance,
 algorithms which are run as a step in a larger model or as a subcomponent of a script-based algorithm
 will call postProcessAlgorithm from the same thread as that model/script it being executed in.

 postProcessAlgorithm will not be called if the prepareAlgorithm() step failed (returned false),
 or if an exception was raised by the processAlgorithm() step.

 :return: A map of algorithm outputs. These may be output layer references, or calculated
 values such as statistical calculations. Implementations which return a non-empty
 map will override any results returned by processAlgorithm().

.. seealso:: prepareAlgorithm()
.. seealso:: processAlgorithm()
 :rtype: QVariantMap
%End

    QString parameterAsString( const QVariantMap &parameters, const QString &name, const QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a static string value.
 :rtype: str
%End

    QString parameterAsExpression( const QVariantMap &parameters, const QString &name, const QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to an expression.
 :rtype: str
%End

    double parameterAsDouble( const QVariantMap &parameters, const QString &name, const QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a static double value.
 :rtype: float
%End

    int parameterAsInt( const QVariantMap &parameters, const QString &name, const QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a static integer value.
 :rtype: int
%End

    int parameterAsEnum( const QVariantMap &parameters, const QString &name, const QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a enum value.
 :rtype: int
%End

    QList<int> parameterAsEnums( const QVariantMap &parameters, const QString &name, const QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to list of enum values.
 :rtype: list of int
%End

    bool parameterAsBool( const QVariantMap &parameters, const QString &name, const QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a static boolean value.
 :rtype: bool
%End

    QgsFeatureSink *parameterAsSink( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context, QString &destinationIdentifier /Out/,
                                     const QgsFields &fields, QgsWkbTypes::Type geometryType = QgsWkbTypes::NoGeometry, const QgsCoordinateReferenceSystem &crs = QgsCoordinateReferenceSystem() ) const /Factory/;
%Docstring
 Evaluates the parameter with matching ``name`` to a feature sink.

 Sinks will either be taken from ``context``'s active project, or created from external
 providers and stored temporarily in the ``context``.

 The ``fields``, ``geometryType`` and ``crs`` parameters dictate the properties
 of the resulting feature sink.

 The ``destinationIdentifier`` argument will be set to a string which can be used to retrieve the layer corresponding
 to the sink, e.g. via calling QgsProcessingUtils.mapLayerFromString().

 This function creates a new object and the caller takes responsibility for deleting the returned object.
 :rtype: QgsFeatureSink
%End

    QgsProcessingFeatureSource *parameterAsSource( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const /Factory/;
%Docstring
 Evaluates the parameter with matching ``name`` to a feature source.

 Sources will either be taken from ``context``'s active project, or loaded from external
 sources and stored temporarily in the ``context``.

 This function creates a new object and the caller takes responsibility for deleting the returned object.
 :rtype: QgsProcessingFeatureSource
%End

    QString parameterAsCompatibleSourceLayerPath( const QVariantMap &parameters, const QString &name,
        QgsProcessingContext &context, const QStringList &compatibleFormats, const QString &preferredFormat = QString( "shp" ), QgsProcessingFeedback *feedback = 0 );
%Docstring
 Evaluates the parameter with matching ``name`` to a source vector layer file path of compatible format.

 If the parameter is evaluated to an existing layer, and that layer is not of the format listed in the
 ``compatibleFormats`` argument, then the layer will first be exported to a compatible format
 in a temporary location. The function will then return the path to that temporary file.

 ``compatibleFormats`` should consist entirely of lowercase file extensions, e.g. 'shp'.

 The ``preferredFormat`` argument is used to specify to desired file extension to use when a temporary
 layer export is required.
 :rtype: str
%End

    QgsMapLayer *parameterAsLayer( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a map layer.

 Layers will either be taken from ``context``'s active project, or loaded from external
 sources and stored temporarily in the ``context``. In either case, callers do not
 need to handle deletion of the returned layer.
 :rtype: QgsMapLayer
%End

    QgsRasterLayer *parameterAsRasterLayer( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a raster layer.

 Layers will either be taken from ``context``'s active project, or loaded from external
 sources and stored temporarily in the ``context``. In either case, callers do not
 need to handle deletion of the returned layer.
 :rtype: QgsRasterLayer
%End

    QString parameterAsOutputLayer( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a output layer destination.
 :rtype: str
%End

    QString parameterAsFileOutput( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a file based output destination.
 :rtype: str
%End

    QgsVectorLayer *parameterAsVectorLayer( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a vector layer.

 Layers will either be taken from ``context``'s active project, or loaded from external
 sources and stored temporarily in the ``context``. In either case, callers do not
 need to handle deletion of the returned layer.
 :rtype: QgsVectorLayer
%End

    QgsCoordinateReferenceSystem parameterAsCrs( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a coordinate reference system.
 :rtype: QgsCoordinateReferenceSystem
%End

    QgsRectangle parameterAsExtent( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a rectangular extent.
 :rtype: QgsRectangle
%End

    QgsPointXY parameterAsPoint( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a point.
 :rtype: QgsPointXY
%End

    QString parameterAsFile( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a file/folder name.
 :rtype: str
%End

    QVariantList parameterAsMatrix( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a matrix/table of values.
 Tables are collapsed to a 1 dimensional list.
 :rtype: QVariantList
%End

    QList< QgsMapLayer *> parameterAsLayerList( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a list of map layers.
 :rtype: list of QgsMapLayer
%End

    QList<double> parameterAsRange( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a range of values.
 :rtype: list of float
%End

    QStringList parameterAsFields( const QVariantMap &parameters, const QString &name, QgsProcessingContext &context ) const;
%Docstring
 Evaluates the parameter with matching ``name`` to a list of fields.
 :rtype: list of str
%End

  private:
    QgsProcessingAlgorithm( const QgsProcessingAlgorithm &other );
};
QFlags<QgsProcessingAlgorithm::Flag> operator|(QgsProcessingAlgorithm::Flag f1, QFlags<QgsProcessingAlgorithm::Flag> f2);





class QgsProcessingFeatureBasedAlgorithm : QgsProcessingAlgorithm
{
%Docstring
 An abstract QgsProcessingAlgorithm base class for processing algorithms which operate "feature-by-feature".

 Feature based algorithms are algorithms which operate on individual features in isolation. These
 are algorithms where one feature is output for each input feature, and the output feature result
 for each input feature is not dependent on any other features present in the source.

 For instance, algorithms like "centroids" and "buffers" are feature based algorithms since the centroid
 or buffer of a feature is calculated for each feature in isolation. An algorithm like "dissolve"
 is NOT suitable for a feature based algorithm as the dissolved output depends on multiple input features
 and these features cannot be processed in isolation.

 Using QgsProcessingFeatureBasedAlgorithm as the base class for feature based algorithms allows
 shortcutting much of the common algorithm code for handling iterating over sources and pushing
 features to output sinks. It also allows the algorithm execution to be optimised in future
 (for instance allowing automatic multi-thread processing of the algorithm, or use of the
 algorithm in "chains", avoiding the need for temporary outputs in multi-step models).

.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgsprocessingalgorithm.h"
%End
  public:

    QgsProcessingFeatureBasedAlgorithm();
%Docstring
 Constructor for QgsProcessingFeatureBasedAlgorithm.
%End

  protected:

    virtual void initAlgorithm( const QVariantMap &configuration = QVariantMap() );


    virtual QString outputName() const = 0;
%Docstring
 Returns the translated, user visible name for any layers created by this algorithm.
 This name will be used as the default name when loading the resultant layer into a
 QGIS project.
 :rtype: str
%End

    virtual QgsProcessing::SourceType outputLayerType() const;
%Docstring
 Returns the layer type for layers generated by this algorithm, if
 this is possible to determine in advance.
 :rtype: QgsProcessing.SourceType
%End

    virtual QgsWkbTypes::Type outputWkbType( QgsWkbTypes::Type inputWkbType ) const;
%Docstring
 Maps the input WKB geometry type (``inputWkbType``) to the corresponding
 output WKB type generated by the algorithm. The default behavior is that the algorithm maintains
 the same WKB type.
 This is called once by the base class when creating the output sink for the algorithm (i.e. it is
 not called once per feature processed).
 :rtype: QgsWkbTypes.Type
%End

    virtual QgsFields outputFields( const QgsFields &inputFields ) const;
%Docstring
 Maps the input source fields (``inputFields``) to corresponding
 output fields generated by the algorithm. The default behavior is that the algorithm maintains
 the same fields as are input.
 Algorithms which add, remove or modify existing fields should override this method and
 implement logic here to indicate which fields are output by the algorithm.

 This is called once by the base class when creating the output sink for the algorithm (i.e. it is
 not called once per feature processed).
 :rtype: QgsFields
%End

    virtual QgsCoordinateReferenceSystem outputCrs( const QgsCoordinateReferenceSystem &inputCrs ) const;
%Docstring
 Maps the input source coordinate reference system (``inputCrs``) to a corresponding
 output CRS generated by the algorithm. The default behavior is that the algorithm maintains
 the same CRS as the input source.

 This is called once by the base class when creating the output sink for the algorithm (i.e. it is
 not called once per feature processed).
 :rtype: QgsCoordinateReferenceSystem
%End

    virtual void initParameters( const QVariantMap &configuration = QVariantMap() );
%Docstring
 Initializes any extra parameters added by the algorithm subclass. There is no need
 to declare the input source or output sink, as these are automatically created by
 QgsProcessingFeatureBasedAlgorithm.
%End

    QgsCoordinateReferenceSystem sourceCrs() const;
%Docstring
 Returns the source's coordinate reference system. This will only return a valid CRS when
 called from a subclasses' processFeature() implementation.
 :rtype: QgsCoordinateReferenceSystem
%End

    virtual QgsFeature processFeature( const QgsFeature &feature, QgsProcessingFeedback *feedback ) = 0;
%Docstring
 Processes an individual input ``feature`` from the source. Algorithms should implement their
 logic in this method for performing the algorithm's operation (e.g. replacing the feature's
 geometry with the centroid of the original feature geometry for a 'centroid' type
 algorithm).

 Implementations should return the modified feature. Returning an invalid feature (e.g.
 a default constructed QgsFeature) will indicate that this feature should be 'skipped',
 and will not be added to the algorithm's output. Subclasses can use this approach to
 filter the incoming features as desired.

 The provided ``feedback`` object can be used to push messages to the log and for giving feedback
 to users. Note that handling of progress reports and algorithm cancelation is handled by
 the base class and subclasses do not need to reimplement this logic.

 Algorithms can throw a QgsProcessingException if a fatal error occurred which should
 prevent the algorithm execution from continuing. This can be annoying for users though as it
 can break valid model execution - so use with extreme caution, and consider using
 ``feedback`` to instead report non-fatal processing failures for features instead.
 :rtype: QgsFeature
%End

    virtual QVariantMap processAlgorithm( const QVariantMap &parameters,
                                          QgsProcessingContext &context, QgsProcessingFeedback *feedback );

};



/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/processing/qgsprocessingalgorithm.h                         *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
