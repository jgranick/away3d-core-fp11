package away3d.core.traverse
{
	import away3d.arcane;
	import away3d.core.pool.RenderableBase;
	import away3d.entities.IEntity;
	import away3d.lights.DirectionalLight;
	import away3d.lights.LightBase;
	import away3d.lights.LightProbe;
	import away3d.lights.PointLight;

	use namespace arcane;
	
	/**
	 * The EntityCollector class is a traverser for scene partitions that collects all scene graph entities that are
	 * considered potientially visible.
	 *
	 * @see away3d.partition.Partition3D
	 * @see away3d.partition.Entity
	 */
	public class EntityCollector extends CollectorBase
	{
		protected var _skybox:RenderableBase;
		protected var _lights:Vector.<LightBase>;
		private var _directionalLights:Vector.<DirectionalLight>;
		private var _pointLights:Vector.<PointLight>;
		private var _lightProbes:Vector.<LightProbe>;

		public var _pNumLights:Number = 0;

		private var _numDirectionalLights:Number = 0;
		private var _numPointLights:Number = 0;
		private var _numLightProbes:Number = 0;

		/**
		 *
		 */
		public function get directionalLights():Vector.<DirectionalLight>
		{
			return _directionalLights;
		}

		/**
		 *
		 */
		public function get lightProbes():Vector.<LightProbe>
		{
			return _lightProbes;
		}

		/**
		 *
		 */
		public function get lights():Vector.<LightBase>
		{
			return _lights;
		}

		/**
		 *
		 */
		public function get pointLights():Vector.<PointLight>
		{
			return _pointLights;
		}

		/**
		 *
		 */
		public function get skyBox():RenderableBase
		{
			return _skybox;
		}

		public function EntityCollector()
		{
			super();

			_lights = new Vector.<LightBase>();
			_directionalLights = new Vector.<DirectionalLight>();
			_pointLights = new Vector.<PointLight>();
			_lightProbes = new Vector.<LightProbe>();
		}

		/**
		 *
		 * @param entity
		 */
		override public function applyDirectionalLight(entity:IEntity):void
		{
			_directionalLights[ _numDirectionalLights++ ] = entity as DirectionalLight;
		}

		/**
		 *
		 * @param entity
		 */
		override public function applyLightProbe(entity:IEntity):void
		{
			_lightProbes[ _numLightProbes++ ] = entity as LightProbe;
		}

		/**
		 *
		 * @param entity
		 */
		override public function applyPointLight(entity:IEntity):void
		{
			_pointLights[ _numPointLights++ ] = entity as PointLight;
		}

		/**
		 *
		 */
		override public function clear():void
		{
			super.clear();

			_skybox = null;

			if (_pNumLights > 0)
				_lights.length = _pNumLights = 0;

			if (_numDirectionalLights > 0)
				_directionalLights.length = _numDirectionalLights = 0;

			if (_numPointLights > 0)
				_pointLights.length = _numPointLights = 0;

			if (_numLightProbes > 0)
				_lightProbes.length = _numLightProbes = 0;
		}
	}
}
